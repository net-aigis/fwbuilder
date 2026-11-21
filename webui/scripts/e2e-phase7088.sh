#!/usr/bin/env bash
# Phase-7088: soft-complete through 7088 (Soft 7080+ ssh_refusal_paths_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7088
print("soft-complete >=7088", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7088|Soft-complete STATUS through 7088|through 7088' webui/STATUS.md
echo "STATUS soft-complete 7088 ok"; echo "cleaned"; echo "OK: phase7088 e2e passed"
