from pathlib import Path

import pytest

from fwbweb_api.locks import LockError, ProjectLock


def test_exclusive_lock(tmp_path: Path) -> None:
    f = tmp_path / "a.fwb"
    f.write_text("<FWObjectDatabase/>", encoding="utf-8")
    a = ProjectLock(f, "a")
    b = ProjectLock(f, "b")
    a.acquire()
    with pytest.raises(LockError):
        b.acquire()
    a.release()
    b.acquire()
    b.release()
