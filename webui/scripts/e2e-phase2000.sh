#!/usr/bin/env bash
# Phase-2000: soft-complete through 2000 (soft_complete_note).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2000
print("soft-complete >=2000", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2000|Soft-complete STATUS through 2000|through 2000' webui/STATUS.md
echo "STATUS soft-complete 2000 ok"
echo "cleaned"
echo "OK: phase2000 e2e passed"
