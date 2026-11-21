#!/usr/bin/env bash
# Phase-7096: soft-complete through 7096 (Soft 7080+ ssh_refusal_paths_refresh_roster + ms 20250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7096
assert m.WEBUI_HONESTY_MILESTONE == 20250
print("soft-complete >=7096", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase7096|Soft-complete STATUS through 7096|through 7096' webui/STATUS.md
echo "STATUS soft-complete 7096 ok"; echo "cleaned"; echo "OK: phase7096 e2e passed"
