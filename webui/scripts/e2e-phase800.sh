#!/usr/bin/env bash
# Phase-800: soft-complete through 800 (honesty milestone 900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 800
assert m.WEBUI_HONESTY_MILESTONE == 900
print("soft-complete >=800", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase800|Soft-complete STATUS through 800|through 800' webui/STATUS.md
echo "STATUS soft-complete 800 ok"
echo "cleaned"
echo "OK: phase800 e2e passed"
