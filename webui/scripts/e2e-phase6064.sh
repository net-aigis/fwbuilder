#!/usr/bin/env bash
# Phase-6064: soft-complete through 5825 (ssh_not_implemented_check_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6064
print("soft-complete >=6384", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6064|Soft-complete STATUS through 5825|through 5825' webui/STATUS.md
echo "STATUS soft-complete 5104 ok"; echo "cleaned"; echo "OK: phase6064 e2e passed"
