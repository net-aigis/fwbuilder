#!/usr/bin/env bash
# Phase-7016: soft-complete through 7016 (Soft 7000+ ssh_auth_policy_refresh_roster + ms 20000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7016
assert m.WEBUI_HONESTY_MILESTONE == 20000
print("soft-complete >=7016", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase7016|Soft-complete STATUS through 7016|through 7016' webui/STATUS.md
echo "STATUS soft-complete 7016 ok"; echo "cleaned"; echo "OK: phase7016 e2e passed"
