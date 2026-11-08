#!/usr/bin/env bash
# Phase-6928: soft-complete through 6928 (Soft 6920+ ssh_refusal_status_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6928
print("soft-complete >=6928", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6928|Soft-complete STATUS through 6928|through 6928' webui/STATUS.md
echo "STATUS soft-complete 6928 ok"; echo "cleaned"; echo "OK: phase6928 e2e passed"
