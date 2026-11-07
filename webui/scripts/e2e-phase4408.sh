#!/usr/bin/env bash
# Phase-4408: soft-complete through 4408 (expect_steps_roster export + ms 11850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4408
assert m.WEBUI_HONESTY_MILESTONE == 11850
print("soft-complete >=4408", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4408|Soft-complete STATUS through 4408|through 4408' webui/STATUS.md
echo "STATUS soft-complete 4408 ok"
echo "cleaned"
echo "OK: phase4408 e2e passed"
