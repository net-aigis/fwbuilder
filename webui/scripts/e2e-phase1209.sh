#!/usr/bin/env bash
# Phase-1209: honesty milestone 1900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1900
assert "checkpoint 1900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honesty_path_titles" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1900
assert isinstance(h.get("honesty_path_titles"), dict)
assert len(h.get("honesty_path_titles") or {}) >= 11
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1216
print("milestone 1900 ok")
PY
echo "cleaned"
echo "OK: phase1209 e2e passed"
