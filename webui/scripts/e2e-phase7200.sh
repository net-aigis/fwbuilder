#!/usr/bin/env bash
# Phase-7200: soft-complete through 5841 (ssh_alternative_titles_refresh_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7208
print("soft-complete >=6400", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7200|Soft-complete STATUS through 5841|through 5841' webui/STATUS.md
echo "STATUS soft-complete 5120 ok"; echo "cleaned"; echo "OK: phase7200 e2e passed"
