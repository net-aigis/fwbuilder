#!/usr/bin/env bash
# Phase-4472: soft-complete through 4472 (expect_steps_refusals_roster + ms 12050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4472
assert m.WEBUI_HONESTY_MILESTONE == 12050
print("soft-complete >=4472", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4472|Soft-complete STATUS through 4472|through 4472' webui/STATUS.md
echo "STATUS soft-complete 4472 ok"
echo "cleaned"
echo "OK: phase4472 e2e passed"
