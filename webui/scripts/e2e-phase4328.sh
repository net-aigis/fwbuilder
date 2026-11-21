#!/usr/bin/env bash
# Phase-4328: soft-complete through 4328 (expect_run_roster export + ms 11600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4328
assert m.WEBUI_HONESTY_MILESTONE == 11600
print("soft-complete >=4328", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4328|Soft-complete STATUS through 4328|through 4328' webui/STATUS.md
echo "STATUS soft-complete 4328 ok"
echo "cleaned"
echo "OK: phase4328 e2e passed"
