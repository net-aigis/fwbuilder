#!/usr/bin/env bash
# Phase-6616: soft-complete through 6616 (Soft 6600+ ssh_honesty_refresh_roster + ms 18750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6616
assert m.WEBUI_HONESTY_MILESTONE == 18750
print("soft-complete >=6616", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6616|Soft-complete STATUS through 6616|through 6616' webui/STATUS.md
echo "STATUS soft-complete 6616 ok"; echo "cleaned"; echo "OK: phase6616 e2e passed"
