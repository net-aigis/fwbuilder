#!/usr/bin/env bash
# Phase-3585: honesty milestone 9300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9300
assert "checkpoint 9300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "changelog_meta" in m.WEBUI_HONESTY_MILESTONE_NOTE or "surface_changelog_meta" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3592
print("milestone 9300 ok")
PY
echo "cleaned"
echo "OK: phase3585 e2e passed"
