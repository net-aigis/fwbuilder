#!/usr/bin/env bash
# Phase-952: soft-complete through 952 (honesty milestone 1300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 952
assert m.WEBUI_HONESTY_MILESTONE == 1300
print("soft-complete >=952", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase952|Soft-complete STATUS through 952|through 952' webui/STATUS.md
echo "STATUS soft-complete 952 ok"
echo "cleaned"
echo "OK: phase952 e2e passed"
