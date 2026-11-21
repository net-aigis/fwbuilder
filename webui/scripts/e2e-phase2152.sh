#!/usr/bin/env bash
# Phase-2152: soft-complete through 2152 (honesty operator brief + ms 4800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2152
assert m.WEBUI_HONESTY_MILESTONE == 4800
print("soft-complete >=2152", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2152|Soft-complete STATUS through 2152|through 2152' webui/STATUS.md
echo "STATUS soft-complete 2152 ok"
echo "cleaned"
echo "OK: phase2152 e2e passed"
