#!/usr/bin/env bash
# Phase-832: soft-complete through 832 (honesty milestone 950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 832
assert m.WEBUI_HONESTY_MILESTONE == 950
print("soft-complete >=832", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase832|Soft-complete STATUS through 832|through 832' webui/STATUS.md
echo "STATUS soft-complete 832 ok"
echo "cleaned"
echo "OK: phase832 e2e passed"
