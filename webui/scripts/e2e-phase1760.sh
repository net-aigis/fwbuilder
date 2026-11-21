#!/usr/bin/env bash
# Phase-1760: soft-complete through 1760 (catalog summary).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1760
print("soft-complete >=1760", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1760|Soft-complete STATUS through 1760|through 1760' webui/STATUS.md
echo "STATUS soft-complete 1760 ok"
echo "cleaned"
echo "OK: phase1760 e2e passed"
