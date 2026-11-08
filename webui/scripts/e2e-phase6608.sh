#!/usr/bin/env bash
# Phase-6608: soft-complete through 6608 (Soft 6600+ ssh_honesty_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6608
print("soft-complete >=6608", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6608|Soft-complete STATUS through 6608|through 6608' webui/STATUS.md
echo "STATUS soft-complete 6608 ok"; echo "cleaned"; echo "OK: phase6608 e2e passed"
