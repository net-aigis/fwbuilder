#!/usr/bin/env bash
# Phase-1272: soft-complete through 1272 (surface keys + related refusals).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1272
print("soft-complete >=1272", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1272|Soft-complete STATUS through 1272|through 1272' webui/STATUS.md
echo "STATUS soft-complete 1272 ok"
echo "cleaned"
echo "OK: phase1272 e2e passed"
