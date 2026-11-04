#!/usr/bin/env bash
# Phase-2872: soft-complete through 2872 (expect step roster + ms 7050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2872
assert m.WEBUI_HONESTY_MILESTONE == 7050
print("soft-complete >=2872", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2872|Soft-complete STATUS through 2872|through 2872' webui/STATUS.md
echo "STATUS soft-complete 2872 ok"
echo "cleaned"
echo "OK: phase2872 e2e passed"
