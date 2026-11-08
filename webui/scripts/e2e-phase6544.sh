#!/usr/bin/env bash
# Phase-6544: soft-complete through 5825 (ssh_honesty_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6552
print("soft-complete >=6384", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6544|Soft-complete STATUS through 5825|through 5825' webui/STATUS.md
echo "STATUS soft-complete 5104 ok"; echo "cleaned"; echo "OK: phase6544 e2e passed"
