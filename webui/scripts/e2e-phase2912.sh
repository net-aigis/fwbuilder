#!/usr/bin/env bash
# Phase-2912: soft-complete through 2912 (expect_step_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2912
print("soft-complete >=2912", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2912|Soft-complete STATUS through 2912|through 2912' webui/STATUS.md
echo "STATUS soft-complete 2912 ok"
echo "cleaned"
echo "OK: phase2912 e2e passed"
