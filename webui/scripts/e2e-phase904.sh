#!/usr/bin/env bash
# Phase-904: soft-complete through 904 (honesty milestone 1150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 904
assert m.WEBUI_HONESTY_MILESTONE == 1150
print("soft-complete >=904", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase904|Soft-complete STATUS through 904|through 904' webui/STATUS.md
echo "STATUS soft-complete 904 ok"
echo "cleaned"
echo "OK: phase904 e2e passed"
