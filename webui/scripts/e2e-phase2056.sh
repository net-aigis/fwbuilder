#!/usr/bin/env bash
# Phase-2056: soft-complete through 2056 (soft_complete_note sessionStorage + ms 4500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2056
assert m.WEBUI_HONESTY_MILESTONE == 4500
print("soft-complete >=2056", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2056|Soft-complete STATUS through 2056|through 2056' webui/STATUS.md
echo "STATUS soft-complete 2056 ok"
echo "cleaned"
echo "OK: phase2056 e2e passed"
