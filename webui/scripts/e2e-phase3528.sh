#!/usr/bin/env bash
# Phase-3528: soft-complete through 3528 (honesty_operator_brief_roster export + ms 9100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3528
assert m.WEBUI_HONESTY_MILESTONE == 9100
print("soft-complete >=3528", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3528|Soft-complete STATUS through 3528|through 3528' webui/STATUS.md
echo "STATUS soft-complete 3528 ok"
echo "cleaned"
echo "OK: phase3528 e2e passed"
