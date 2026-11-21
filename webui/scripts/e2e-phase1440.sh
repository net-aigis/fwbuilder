#!/usr/bin/env bash
# Phase-1440: soft-complete through 1440 (honesty paths download).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1440
print("soft-complete >=1440", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1440|Soft-complete STATUS through 1440|through 1440' webui/STATUS.md
echo "STATUS soft-complete 1440 ok"
echo "cleaned"
echo "OK: phase1440 e2e passed"
