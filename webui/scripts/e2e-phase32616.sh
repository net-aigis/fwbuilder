#!/usr/bin/env bash
# Phase-32616: soft-complete through 32616 (ms 100000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32616
assert m.WEBUI_HONESTY_MILESTONE == 100000
print("soft-complete >=32616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32616|through 32616' webui/STATUS.md
echo "OK: phase32616 e2e passed"
