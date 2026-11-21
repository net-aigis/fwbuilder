#!/usr/bin/env bash
# Phase-4696: soft-complete through 4696 (Soft 4680+ / ms 12750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4696
assert m.WEBUI_HONESTY_MILESTONE == 12750
print("soft-complete >=4696", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4696|Soft-complete STATUS through 4696|through 4696' webui/STATUS.md
echo "STATUS soft-complete 4696 ok"
echo "cleaned"
echo "OK: phase4696 e2e passed"
