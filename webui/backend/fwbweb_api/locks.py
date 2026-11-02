"""Advisory exclusive locks for .fwb paths (multi-user write protection)."""

from __future__ import annotations

import os
import time
from pathlib import Path


class LockError(RuntimeError):
    pass


class ProjectLock:
    def __init__(self, path: Path, holder: str) -> None:
        self.path = path.resolve()
        self.holder = holder
        self.lock_path = Path(str(self.path) + ".fwbweb.lock")
        self._fd: int | None = None

    def acquire(self) -> None:
        self.lock_path.parent.mkdir(parents=True, exist_ok=True)
        fd = os.open(str(self.lock_path), os.O_CREAT | os.O_RDWR, 0o644)
        try:
            import fcntl

            fcntl.flock(fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            os.close(fd)
            raise LockError(f"project locked: {self.path}") from exc
        except ImportError:
            # Non-POSIX fallback: refuse if foreign lock file is fresh.
            if self.lock_path.exists():
                age = time.time() - self.lock_path.stat().st_mtime
                if age < 3600 and self.lock_path.read_text(encoding="utf-8").strip() != self.holder:
                    os.close(fd)
                    raise LockError(f"project locked: {self.path}")
        payload = f"{self.holder}\n{time.time()}\n"
        os.ftruncate(fd, 0)
        os.write(fd, payload.encode("utf-8"))
        self._fd = fd

    def release(self) -> None:
        if self._fd is None:
            return
        try:
            import fcntl

            fcntl.flock(self._fd, fcntl.LOCK_UN)
        except ImportError:
            pass
        os.close(self._fd)
        self._fd = None
        try:
            self.lock_path.unlink(missing_ok=True)
        except OSError:
            pass
