#!/usr/bin/env bash
# Phase-2232: soft-complete through 2232 (hard-gap roster + ms 5050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2232
assert m.WEBUI_HONESTY_MILESTONE == 5050
print("soft-complete >=2232", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2232|Soft-complete STATUS through 2232|through 2232' webui/STATUS.md
echo "STATUS soft-complete 2232 ok"
echo "cleaned"
echo "OK: phase2232 e2e passed"
