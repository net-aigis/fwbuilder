"""Invoke existing fwb_* compiler binaries (same CLIs as the desktop GUI)."""

from __future__ import annotations

import os
import subprocess
from pathlib import Path
from typing import Any

from .platforms import compiler_for_platform_name
from .settings import settings

_REPO_ROOT = Path(__file__).resolve().parents[3]

# Fallback when resources XML is unavailable; prefer platforms.compiler_for_platform_name.
PLATFORM_COMPILER: dict[str, str] = {
    "iptables": "fwb_ipt",
    "nftables": "fwb_nft",
    "pf": "fwb_pf",
    "ipf": "fwb_ipf",
    "ipfw": "fwb_ipfw",
    "cisco_asa": "fwb_pix",
    "pix": "fwb_pix",
    "fwsm": "fwb_pix",
    "iosacl": "fwb_iosacl",
    "nxosacl": "fwb_nxosacl",
    "junosacl": "fwb_junosacl",
    "procurve_acl": "fwb_procurve_acl",
}


class CompileError(RuntimeError):
    def __init__(self, message: str, *, exit_code: int | None = None, log: str = "") -> None:
        super().__init__(message)
        self.exit_code = exit_code
        self.log = log


def compiler_for_platform(platform: str) -> str:
    key = (platform or "").strip().lower()
    name = compiler_for_platform_name(key) or PLATFORM_COMPILER.get(key)
    if not name:
        raise CompileError(f"unsupported platform for compile: {platform!r}")
    return name


def _resolve_compiler(name: str) -> tuple[list[str], Path | None]:
    """Return argv prefix and optional host binary path.

    Prefer a host wrapper under webui/bin/<name>, else run the ELF inside Podman
    (same image as fwbweb), else a native path from FWBWEB_COMPILER_DIR.
    """
    wrapper = _REPO_ROOT / "webui" / "bin" / name
    if wrapper.is_file() and os.access(wrapper, os.X_OK):
        return [str(wrapper)], wrapper

    env_dir = os.environ.get("FWBWEB_COMPILER_DIR") or (
        str(settings.compiler_dir) if settings.compiler_dir else None
    )
    if env_dir:
        native = Path(env_dir) / name
        if native.is_file() and os.access(native, os.X_OK):
            return [str(native)], native

    # Map fwb_nft → src/nft/fwb_nft, fwb_ipt → src/ipt/fwb_ipt, …
    stem = name.removeprefix("fwb_")
    candidates = [
        _REPO_ROOT / "src" / stem / name,
        _REPO_ROOT / "src" / stem / "release" / name,
    ]
    image = os.environ.get("FWBWEB_IMAGE", "fwbuilder-linux-qt6")
    for elf in candidates:
        if elf.is_file() and os.access(elf, os.X_OK):
            # Run inside Podman so Fedora libxml2 matches the build.
            container_path = f"/src/{elf.relative_to(_REPO_ROOT).as_posix()}"
            return [
                "podman",
                "run",
                "--rm",
                "-i",
                "-v",
                f"{_REPO_ROOT}:/src:Z",
                "-w",
                "/src",
                "-e",
                "FWBUILDER_RES_DIR=/src/webui/.res",
                image,
                container_path,
            ], elf

    raise CompileError(
        f"compiler binary not found for {name}; build with "
        "docker/build-linux-qt6-fwbweb.sh (compilers) or set FWBWEB_COMPILER_DIR"
    )


def run_compiler(
    *,
    platform: str,
    fwb_path: Path,
    firewall_name: str,
    destdir: Path,
    ipv: str | None = None,
) -> dict[str, Any]:
    name = compiler_for_platform(platform)
    argv_prefix, resolved = _resolve_compiler(name)
    fwb_path = fwb_path.resolve()
    destdir = destdir.resolve()
    destdir.mkdir(parents=True, exist_ok=True)

    # Paths for containerized runs must be under the repo mount.
    mapped_fwb = fwb_path
    mapped_dest = destdir
    if argv_prefix[0] == "podman":
        try:
            mapped_fwb_s = f"/src/{fwb_path.relative_to(_REPO_ROOT).as_posix()}"
            mapped_dest_s = f"/src/{destdir.relative_to(_REPO_ROOT).as_posix()}"
        except ValueError as exc:
            raise CompileError(
                f"paths must be inside the repo for containerized compile: {fwb_path}"
            ) from exc
    else:
        mapped_fwb_s = str(mapped_fwb)
        mapped_dest_s = str(mapped_dest)

    cmd = [
        *argv_prefix,
        "-f",
        mapped_fwb_s,
        "-d",
        mapped_dest_s,
        "-D",
        "/src/webui/.res" if argv_prefix[0] == "podman" else str(_REPO_ROOT / "webui" / ".res"),
        "-q",
    ]
    if ipv == "4":
        cmd.append("-4")
    elif ipv == "6":
        cmd.append("-6")
    cmd.append(firewall_name)

    env = {**os.environ}
    env.setdefault("FWBUILDER_RES_DIR", str(_REPO_ROOT / "webui" / ".res"))

    proc = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        env=env,
        timeout=float(settings.bridge_timeout_sec),
        check=False,
    )
    log = (proc.stdout or "") + (proc.stderr or "")
    if proc.returncode != 0:
        raise CompileError(
            f"{name} exited {proc.returncode}",
            exit_code=proc.returncode,
            log=log,
        )

    outputs = sorted(p.name for p in destdir.iterdir() if p.is_file()) if destdir.is_dir() else []
    return {
        "ok": True,
        "compiler": name,
        "resolved": str(resolved) if resolved else None,
        "firewall": firewall_name,
        "platform": platform,
        "destdir": str(destdir),
        "outputs": outputs,
        "log": log,
        "exit_code": proc.returncode,
    }
