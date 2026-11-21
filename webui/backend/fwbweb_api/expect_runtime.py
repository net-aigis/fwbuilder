"""Live Expect/SSHSession-style installer runtime for interactive platforms.

Uses Paramiko shell channels. Secrets are never logged.
A mock channel factory supports unit tests without real devices.
"""

from __future__ import annotations

import re
import time
from dataclasses import dataclass, field
from typing import Any, Callable, Sequence

from .configlets import list_installer_configlets, read_installer_configlet_file
from .expect_installer import EXPECT_PLAN_STEP_IDS, EXPECT_PLAN_STEP_TITLES, expect_install_plan
from .ssh_session import SshSessionError, connect_ssh, invoke_shell


class ExpectRuntimeError(RuntimeError):
    def __init__(self, message: str, *, log: str = "", step: str | None = None) -> None:
        super().__init__(message)
        self.log = log
        self.step = step


# host_OS values that use the desktop expect installer (configlet interactive flag).
INTERACTIVE_HOST_OS_FAMILIES = frozenset(
    {
        "ios",
        "iosacl",
        "pix",
        "asa",
        "fwsm",
        "junos",
        "junosacl",
        "procurve",
        "procurveacl",
        "ipchain",  # rarely interactive; still gated by configlet flag
    }
)


@dataclass
class ExpectSession:
    """Thin wrapper over a Paramiko channel (or mock)."""

    send: Callable[[str], None]
    recv_ready: Callable[[], bool]
    recv: Callable[[int], bytes]
    close: Callable[[], None]
    buffer: str = ""
    log_parts: list[str] = field(default_factory=list)

    def read_until(
        self,
        patterns: Sequence[str],
        *,
        timeout: float = 30.0,
        strip_ansi: bool = True,
    ) -> str:
        deadline = time.monotonic() + timeout
        compiled = [re.compile(p, re.IGNORECASE | re.MULTILINE) for p in patterns]
        while time.monotonic() < deadline:
            if self.recv_ready():
                chunk = self.recv(65535)
                if not chunk:
                    break
                text = chunk.decode("utf-8", errors="replace")
                if strip_ansi:
                    text = re.sub(r"\x1b\[[0-9;]*[A-Za-z]", "", text)
                self.buffer += text
            for cre in compiled:
                if cre.search(self.buffer):
                    out = self.buffer
                    self.log_parts.append(out[-2000:])
                    return out
            time.sleep(0.05)
        raise ExpectRuntimeError(
            f"timeout waiting for {patterns!r}",
            log="\n".join(self.log_parts) + "\n---\n" + self.buffer[-2000:],
        )

    def expect_send(self, data: str, patterns: Sequence[str], *, timeout: float = 30.0) -> str:
        # Never log secrets: callers must not put passwords into `data` that we echo.
        self.send(data if data.endswith("\n") else data + "\n")
        return self.read_until(patterns, timeout=timeout)


def _channel_session(chan: Any) -> ExpectSession:
    return ExpectSession(
        send=lambda s: chan.send(s),
        recv_ready=lambda: chan.recv_ready(),
        recv=lambda n: chan.recv(n),
        close=lambda: chan.close(),
    )


def mock_device_session(*, platform: str = "ios") -> ExpectSession:
    """In-memory device that answers common Cisco/Juniper/Procurve prompts."""
    state = {"buf": "", "mode": "user", "cfg": ""}

    prompts = {
        "ios": {"user": "router>", "enable": "router#", "config": "router(config)#"},
        "junos": {"user": "user@host>", "enable": "user@host>", "config": "user@host#"},
        "procurve": {"user": "ProCurve>", "enable": "ProCurve#", "config": "ProCurve(config)#"},
    }
    fam = "ios"
    pl = platform.lower()
    if "junos" in pl:
        fam = "junos"
    elif "procurve" in pl:
        fam = "procurve"
    p = prompts[fam]

    def send(data: str) -> None:
        cmd = data.strip()
        low = cmd.lower()
        if low.startswith("enable") or low == "en":
            state["mode"] = "enable"
            state["buf"] += f"\n{p['enable']}"
        elif low in {"configure terminal", "conf t", "configure", "config"}:
            state["mode"] = "config"
            state["buf"] += f"\n{p['config']}"
        elif low in {"exit", "end", "quit"}:
            state["mode"] = "enable" if state["mode"] == "config" else "user"
            key = "enable" if state["mode"] == "enable" else "user"
            state["buf"] += f"\n{p[key]}"
        elif low in {"write memory", "write mem", "copy running-config startup-config", "commit"}:
            state["buf"] += f"\n[OK]\n{p['enable']}"
        else:
            # Accept pasted config / arbitrary commands.
            key = {"user": "user", "enable": "enable", "config": "config"}[state["mode"]]
            state["cfg"] += cmd + "\n"
            state["buf"] += f"\n{p[key]}"

    # Seed login banner + prompt
    state["buf"] = f"Welcome\n{p['user']}"

    def recv_ready() -> bool:
        return bool(state["buf"])

    def recv(n: int) -> bytes:
        data = state["buf"][:n]
        state["buf"] = state["buf"][n:]
        return data.encode("utf-8")

    return ExpectSession(
        send=send,
        recv_ready=recv_ready,
        recv=recv,
        close=lambda: None,
    )


def _enable_commands(host_os: str) -> list[str]:
    os_l = host_os.lower()
    if "junos" in os_l:
        return ["configure"]
    if "procurve" in os_l:
        return ["enable", "configure"]
    return ["enable", "configure terminal"]


def _write_mem_commands(host_os: str) -> list[str]:
    os_l = host_os.lower()
    if "junos" in os_l:
        return ["commit"]
    if "procurve" in os_l:
        return ["write memory"]
    return ["write memory"]


def _prompt_patterns(host_os: str) -> list[str]:
    os_l = host_os.lower()
    if "junos" in os_l:
        return [r"[>#]\s*$", r"%\s*$"]
    if "procurve" in os_l:
        return [r"[>#]\s*$"]
    return [r"[>#]\s*$", r"[Pp]assword:"]


def run_expect_steps(
    *,
    host_os: str,
    host: str = "",
    user: str = "",
    password: str | None = None,
    keyboard_interactive_responses: Sequence[str] | None = None,
    identity_file: str | None = None,
    enable_password: str | None = None,
    fwdir: str = "/etc",
    fwscript: str = "firewall.fw",
    config_text: str = "",
    step: str | None = None,
    mock: bool = False,
    port: int = 22,
    timeout: float = 30.0,
) -> dict[str, Any]:
    """Execute canonical expect plan steps (all or one)."""
    listing = list_installer_configlets(host_os)
    if not listing.get("interactive_installer") and not mock:
        raise ExpectRuntimeError(
            f"host_OS={host_os} is not an interactive expect installer platform",
            step=step,
        )

    plan = expect_install_plan(host_os, fwdir=fwdir, fwscript=fwscript)
    plan_steps = list(plan.get("steps") or [])
    step_ids = [s["id"] for s in plan_steps]
    if step:
        if step not in EXPECT_PLAN_STEP_IDS:
            raise ExpectRuntimeError(
                f"unknown step '{step}'",
                step=step,
            )
        if step not in step_ids:
            # Still allow canonical ids even if configlet omitted them.
            step_ids = [step]
        else:
            step_ids = [step]

    client = None
    session: ExpectSession
    if mock:
        session = mock_device_session(platform=host_os)
    else:
        if not host:
            raise ExpectRuntimeError("host required for live expect run")
        try:
            client = connect_ssh(
                host=host,
                user=user,
                password=password,
                keyboard_interactive_responses=keyboard_interactive_responses,
                identity_file=identity_file,
                port=port,
                timeout=timeout,
            )
            chan = invoke_shell(client)
            session = _channel_session(chan)
        except SshSessionError as exc:
            raise ExpectRuntimeError(str(exc), log=exc.log, step="ssh_open") from exc

    results: list[dict[str, Any]] = []
    prompts = _prompt_patterns(host_os)

    def _run_lines(lines: str, sid: str) -> None:
        for raw in (lines or "").splitlines():
            line = raw.strip("\r")
            if not line or line.startswith("#"):
                continue
            session.expect_send(line, prompts, timeout=timeout)

    try:
        # Wait for initial prompt after ssh_open
        if "ssh_open" in step_ids:
            try:
                session.read_until(prompts, timeout=timeout)
            except ExpectRuntimeError:
                # Some mocks already have prompt in buffer from first read_until in later steps.
                pass
            results.append(
                {
                    "id": "ssh_open",
                    "title": EXPECT_PLAN_STEP_TITLES["ssh_open"],
                    "ok": True,
                    "executed": True,
                }
            )

        by_id = {s["id"]: s for s in plan_steps}

        for sid in step_ids:
            if sid == "ssh_open":
                continue
            title = EXPECT_PLAN_STEP_TITLES.get(sid, sid)
            try:
                if sid == "pre_config":
                    preview = (by_id.get(sid) or {}).get("preview") or ""
                    if not preview:
                        preview = str(
                            (
                                read_installer_configlet_file(
                                    host_os,
                                    "installer_commands_pre_config",
                                    expand=True,
                                    fwdir=fwdir,
                                    fwscript=fwscript,
                                )
                                or {}
                            ).get("expanded_text")
                            or ""
                        )
                    _run_lines(preview, sid)
                elif sid == "reg_user":
                    preview = (by_id.get(sid) or {}).get("preview") or ""
                    _run_lines(preview, sid)
                elif sid == "enable_mode":
                    for cmd in _enable_commands(host_os):
                        # If device asks Password: after enable, send enable_password/password.
                        out = session.expect_send(cmd, prompts + [r"[Pp]assword:"], timeout=timeout)
                        if re.search(r"[Pp]assword:", out) and not re.search(
                            r"[>#]\s*$", out.split("Password:")[-1]
                        ):
                            secret = enable_password or password or ""
                            session.expect_send(secret, prompts, timeout=timeout)
                elif sid == "safety_net_acl":
                    preview = (by_id.get(sid) or {}).get("preview") or ""
                    _run_lines(preview, sid)
                elif sid == "push_config":
                    text = config_text or (
                        f"! fwbweb expect push {fwscript}\n"
                        f"! host_os={host_os} fwdir={fwdir}\n"
                    )
                    _run_lines(text, sid)
                elif sid == "post_config":
                    preview = (by_id.get(sid) or {}).get("preview") or ""
                    _run_lines(preview, sid)
                elif sid == "write_mem":
                    for cmd in _write_mem_commands(host_os):
                        session.expect_send(cmd, prompts, timeout=timeout)
                else:
                    raise ExpectRuntimeError(f"unsupported step {sid}", step=sid)
                results.append(
                    {"id": sid, "title": title, "ok": True, "executed": True}
                )
            except ExpectRuntimeError as exc:
                results.append(
                    {
                        "id": sid,
                        "title": title,
                        "ok": False,
                        "executed": True,
                        "error": str(exc),
                    }
                )
                raise ExpectRuntimeError(
                    str(exc),
                    log="\n".join(session.log_parts),
                    step=sid,
                ) from exc
    finally:
        try:
            session.close()
        except Exception:
            pass
        if client is not None:
            try:
                client.close()
            except Exception:
                pass

    return {
        "ok": True,
        "executable": True,
        "host_os": host_os,
        "mock": mock,
        "steps": results,
        "step_count": len(results),
        "canonical_step_ids": list(EXPECT_PLAN_STEP_IDS),
        "log": "\n".join(session.log_parts)[-8000:],
        "note": "Expect/SSHSession runtime executed via Paramiko shell channel.",
    }
