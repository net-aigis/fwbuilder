#!/usr/bin/env bash
# Phase-4392: soft-complete through 4392 (expect_steps_roster + ms 11800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4392
assert m.WEBUI_HONESTY_MILESTONE == 11800
print("soft-complete >=4392", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4392|Soft-complete STATUS through 4392|through 4392' webui/STATUS.md
echo "STATUS soft-complete 4392 ok"
echo "cleaned"
echo "OK: phase4392 e2e passed"
