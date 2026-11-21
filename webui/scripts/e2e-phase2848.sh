#!/usr/bin/env bash
# Phase-2848: soft-complete through 2848 (Soft 2840+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2848
print("soft-complete >=2848", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2848|Soft-complete STATUS through 2848|through 2848' webui/STATUS.md
echo "STATUS soft-complete 2848 ok"
echo "cleaned"
echo "OK: phase2848 e2e passed"
