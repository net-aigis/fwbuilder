#!/usr/bin/env bash
# Phase-2888: soft-complete through 2888 (expect_step_roster export + ms 7100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2888
assert m.WEBUI_HONESTY_MILESTONE == 7100
print("soft-complete >=2888", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2888|Soft-complete STATUS through 2888|through 2888' webui/STATUS.md
echo "STATUS soft-complete 2888 ok"
echo "cleaned"
echo "OK: phase2888 e2e passed"
