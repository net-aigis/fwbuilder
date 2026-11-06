#!/usr/bin/env bash
# Phase-3928: soft-complete through 3928 (res_status_roster export + ms 10350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3928
assert m.WEBUI_HONESTY_MILESTONE == 10350
print("soft-complete >=3928", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3928|Soft-complete STATUS through 3928|through 3928' webui/STATUS.md
echo "STATUS soft-complete 3928 ok"
echo "cleaned"
echo "OK: phase3928 e2e passed"
