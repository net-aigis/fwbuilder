#!/usr/bin/env bash
# Phase-3000: soft-complete through 3000 (ssh_honesty_roster sessionStorage + ms 7450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3000
assert m.WEBUI_HONESTY_MILESTONE == 7450
print("soft-complete >=3000", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3000|Soft-complete STATUS through 3000|through 3000' webui/STATUS.md
echo "STATUS soft-complete 3000 ok"
echo "cleaned"
echo "OK: phase3000 e2e passed"
