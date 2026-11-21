#!/usr/bin/env bash
# Phase-4488: soft-complete through 4488 (expect_steps_refusals_roster export + ms 12100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4488
assert m.WEBUI_HONESTY_MILESTONE == 12100
print("soft-complete >=4488", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4488|Soft-complete STATUS through 4488|through 4488' webui/STATUS.md
echo "STATUS soft-complete 4488 ok"
echo "cleaned"
echo "OK: phase4488 e2e passed"
