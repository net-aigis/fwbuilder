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


class BridgeError(RuntimeError):
    def __init__(self, message: str, payload: dict[str, Any] | None = None) -> None:
        super().__init__(message)
        self.payload = payload or {}


class FwbBridge:
    def __init__(self, binary: Path | None = None) -> None:
        self.binary = Path(binary or settings.bridge)
        self.proc: subprocess.Popen[str] | None = None
        self._lock = threading.Lock()
        self.session_id = str(uuid.uuid4())

    def start(self) -> dict[str, Any]:
        if not self.binary.exists():
            raise BridgeError(f"fwbweb bridge not found: {self.binary}")
        self.proc = subprocess.Popen(
            [str(self.binary)],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            bufsize=1,
            env={**os.environ},
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
        payload = {"cmd": cmd, **kwargs}
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
