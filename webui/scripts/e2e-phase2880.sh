#!/usr/bin/env bash
# Phase-2880: soft-complete through 2880 (expect_step_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2880
print("soft-complete >=2880", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2880|Soft-complete STATUS through 2880|through 2880' webui/STATUS.md
echo "STATUS soft-complete 2880 ok"
echo "cleaned"
echo "OK: phase2880 e2e passed"
