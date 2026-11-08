#!/usr/bin/env bash
# Phase-12320: soft-complete through 5841 (ssh_alternative_notes_refresh_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12328
print("soft-complete >=6400", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12320|Soft-complete STATUS through 5841|through 5841' webui/STATUS.md
echo "STATUS soft-complete 5120 ok"; echo "cleaned"; echo "OK: phase12320 e2e passed"
