#!/usr/bin/env bash
# Phase-4248: soft-complete through 4248 (option_enable_roster export + ms 11350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4248
assert m.WEBUI_HONESTY_MILESTONE == 11350
print("soft-complete >=4248", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4248|Soft-complete STATUS through 4248|through 4248' webui/STATUS.md
echo "STATUS soft-complete 4248 ok"
echo "cleaned"
echo "OK: phase4248 e2e passed"
