from __future__ import annotations

import shutil
import threading
import uuid
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from .bridge import BridgeError, FwbBridge
from .locks import LockError, ProjectLock
from .settings import settings


@dataclass
class ProjectSession:
    id: str
    source_path: Path
    work_path: Path
    bridge: FwbBridge
    lock: ProjectLock
    meta: dict[str, Any] = field(default_factory=dict)


class SessionStore:
    def __init__(self) -> None:
        self._sessions: dict[str, ProjectSession] = {}
        self._guard = threading.Lock()
        settings.workspace.mkdir(parents=True, exist_ok=True)

    def open(
        self,
        path: Path,
        *,
        copy_to_workspace: bool = True,
        allow_upgrade: bool = False,
        holder: str = "webui",
    ) -> ProjectSession:
        path = path.resolve()
        if not path.is_file():
            raise FileNotFoundError(str(path))

        sid = str(uuid.uuid4())
        if copy_to_workspace:
            dest_dir = settings.workspace / sid
            dest_dir.mkdir(parents=True, exist_ok=True)
            work = dest_dir / path.name
            shutil.copy2(path, work)
        else:
            work = path

        lock = ProjectLock(work, holder=f"{holder}:{sid}")
        try:
            lock.acquire()
        except LockError:
            if copy_to_workspace:
                shutil.rmtree(work.parent, ignore_errors=True)
            raise

        bridge = FwbBridge()
        try:
            bridge.start()
            bridge.request("open", path=str(work), allow_upgrade=allow_upgrade)
        except BridgeError:
            lock.release()
            bridge.stop()
            if copy_to_workspace:
                shutil.rmtree(work.parent, ignore_errors=True)
            raise

        session = ProjectSession(
            id=sid,
            source_path=path,
            work_path=work,
            bridge=bridge,
            lock=lock,
            meta={"allow_upgrade": allow_upgrade, "copy": copy_to_workspace},
        )
        with self._guard:
            self._sessions[sid] = session
        return session

    def get(self, sid: str) -> ProjectSession:
        with self._guard:
            session = self._sessions.get(sid)
        if session is None:
            raise KeyError(sid)
        return session

    def close(self, sid: str, *, save: bool = False) -> None:
        with self._guard:
            session = self._sessions.pop(sid, None)
        if session is None:
            return
        try:
            if save:
                session.bridge.request("save")
            session.bridge.request("close")
        except BridgeError:
            pass
        session.bridge.stop()
        session.lock.release()
        if session.meta.get("copy"):
            shutil.rmtree(session.work_path.parent, ignore_errors=True)


store = SessionStore()
