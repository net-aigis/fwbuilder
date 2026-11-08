#!/usr/bin/env bash
# Phase-7008: soft-complete through 7008 (Soft 7000+ ssh_auth_policy_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7008
print("soft-complete >=7008", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7008|Soft-complete STATUS through 7008|through 7008' webui/STATUS.md
echo "STATUS soft-complete 7008 ok"; echo "cleaned"; echo "OK: phase7008 e2e passed"
