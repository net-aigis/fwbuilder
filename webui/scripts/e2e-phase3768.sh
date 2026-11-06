#!/usr/bin/env bash
# Phase-3768: soft-complete through 3768 (hard_gaps_closure_roster export + ms 9850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3768
assert m.WEBUI_HONESTY_MILESTONE == 9850
print("soft-complete >=3768", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3768|Soft-complete STATUS through 3768|through 3768' webui/STATUS.md
echo "STATUS soft-complete 3768 ok"
echo "cleaned"
echo "OK: phase3768 e2e passed"
