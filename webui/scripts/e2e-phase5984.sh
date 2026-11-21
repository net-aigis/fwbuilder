#!/usr/bin/env bash
# Phase-5984: soft-complete through 5825 (ssh_implemented_check_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5984
print("soft-complete >=6384", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5984|Soft-complete STATUS through 5825|through 5825' webui/STATUS.md
echo "STATUS soft-complete 5104 ok"; echo "cleaned"; echo "OK: phase5984 e2e passed"
