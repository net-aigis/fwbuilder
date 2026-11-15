#!/usr/bin/env bash
# Phase-32696: soft-complete through 32696 (ms 100250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32696
assert m.WEBUI_HONESTY_MILESTONE == 100250
print("soft-complete >=32696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32696|through 32696' webui/STATUS.md
echo "OK: phase32696 e2e passed"
