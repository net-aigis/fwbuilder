"""JSON Lines client for the fwbweb C++ bridge process."""

from __future__ import annotations

import json
import os
import subprocess
import threading
import uuid
from pathlib import Path
from typing import Any

from .settings import settings

# webui/backend/fwbweb_api -> repo root
_REPO_ROOT = Path(__file__).resolve().parents[3]


def _host_elf_ok(path: Path) -> bool:
    """True when the native fwbweb ELF resolves shared libs on this host."""
    if not path.is_file() or not os.access(path, os.X_OK):
        return False
    try:
        out = subprocess.run(
            ["ldd", str(path)],
            check=False,
            capture_output=True,
            text=True,
            timeout=5,
        )
    except (OSError, subprocess.SubprocessError):
        return False
    return "not found" not in (out.stdout or "")


def bridge_runs_in_podman(wrapper: Path) -> bool:
    """Match webui/bin/fwbweb: host ELF when ldd is clean, else Podman."""
    if os.environ.get("FWBWEB_FORCE_PODMAN") == "1":
        return True
    host_bin = Path(os.environ.get("FWBWEB_HOST_BIN", str(_REPO_ROOT / "src" / "fwbweb" / "fwbweb")))
    if _host_elf_ok(host_bin):
        return False
    return wrapper.name == "fwbweb" and "webui/bin" in str(wrapper)


class BridgeError(RuntimeError):
    def __init__(self, message: str, payload: dict[str, Any] | None = None) -> None:
        super().__init__(message)
        self.payload = payload or {}


class FwbBridge:
    def __init__(self, binary: Path | None = None) -> None:
        raw = Path(binary or settings.bridge)
        if not raw.is_absolute():
            # Resolve relative to the backend package cwd convention (webui/backend).
            raw = (Path.cwd() / raw).resolve()
        self.binary = raw
        self.proc: subprocess.Popen[str] | None = None
        self._lock = threading.Lock()
        self.session_id = str(uuid.uuid4())
        # Host wrapper may exec the native ELF (openSUSE) or Podman (Fedora .so.2).
        self._containerized = bridge_runs_in_podman(self.binary)

    def _map_path(self, path: str | None) -> str | None:
        if path is None:
            return None
        p = Path(path).resolve()
        if not self._containerized:
            return str(p)
        try:
            rel = p.relative_to(_REPO_ROOT)
        except ValueError as exc:
            raise BridgeError(
                f"path must be inside the repo for containerized bridge: {p}"
            ) from exc
        return f"/src/{rel.as_posix()}"

    def start(self) -> dict[str, Any]:
        if not self.binary.exists():
            raise BridgeError(f"fwbweb bridge not found: {self.binary}")
        env = {**os.environ}
        res = (
            os.environ.get("FWBUILDER_RES_DIR")
            or os.environ.get("FWBWEB_RES_DIR")
            or (str(settings.res_dir) if settings.res_dir else None)
        )
        if res:
            env["FWBUILDER_RES_DIR"] = self._map_path(res) if self._containerized else res
        elif self._containerized:
            env["FWBUILDER_RES_DIR"] = "/src/webui/.res"
        self.proc = subprocess.Popen(
            [str(self.binary)],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            bufsize=1,
            env=env,
        )
        assert self.proc.stdout is not None
        line = self.proc.stdout.readline()
        if not line:
            err = self.proc.stderr.read() if self.proc.stderr else ""
            raise BridgeError(f"bridge produced no ready banner: {err}")
        ready = json.loads(line)
        if not ready.get("ok"):
            raise BridgeError("bridge failed to start", ready)
        return ready

    def request(self, cmd: str, **kwargs: Any) -> dict[str, Any]:
        if self.proc is None or self.proc.stdin is None or self.proc.stdout is None:
            raise BridgeError("bridge not started")
        payload: dict[str, Any] = {"cmd": cmd, **kwargs}
        if "path" in payload and payload["path"] is not None:
            payload["path"] = self._map_path(str(payload["path"]))
        with self._lock:
            self.proc.stdin.write(json.dumps(payload, ensure_ascii=False) + "\n")
            self.proc.stdin.flush()
            line = self.proc.stdout.readline()
            if not line:
                err = self.proc.stderr.read() if self.proc.stderr else ""
                raise BridgeError(f"bridge closed unexpectedly: {err}")
            data = json.loads(line)
        if not data.get("ok"):
            raise BridgeError(data.get("error", "bridge error"), data)
        return data

    def stop(self) -> None:
        if self.proc is None:
            return
        try:
            if self.proc.stdin and self.proc.poll() is None:
                self.proc.stdin.write(json.dumps({"cmd": "quit"}) + "\n")
                self.proc.stdin.flush()
                self.proc.wait(timeout=5)
        except Exception:
            try:
                self.proc.kill()
            except Exception:
                pass
        finally:
            self.proc = None
