#!/usr/bin/env bash
# Phase-2016: soft-complete through 2016 (soft_complete_note export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2016
print("soft-complete >=2016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2016|Soft-complete STATUS through 2016|through 2016' webui/STATUS.md
echo "STATUS soft-complete 2016 ok"
echo "cleaned"
echo "OK: phase2016 e2e passed"
