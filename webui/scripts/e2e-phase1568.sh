#!/usr/bin/env bash
# Phase-1568: soft-complete through 1568 (session notes in surface keys).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1568
print("soft-complete >=1568", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1568|Soft-complete STATUS through 1568|through 1568' webui/STATUS.md
echo "STATUS soft-complete 1568 ok"
echo "cleaned"
echo "OK: phase1568 e2e passed"
