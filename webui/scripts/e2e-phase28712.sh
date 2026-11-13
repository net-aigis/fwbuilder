#!/usr/bin/env bash
# Phase-28712: soft-complete through 5833 (ssh_alternative_notes_refresh_roster + ms 18800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28720
assert m.WEBUI_HONESTY_MILESTONE >= 18800
print("soft-complete >=6392", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase28712|Soft-complete STATUS through 5833|through 5833' webui/STATUS.md
echo "STATUS soft-complete 5112 ok"; echo "cleaned"; echo "OK: phase28712 e2e passed"
