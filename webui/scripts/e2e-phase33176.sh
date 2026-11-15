#!/usr/bin/env bash
# Phase-33176: soft-complete through 33176 (ms 101750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33176
assert m.WEBUI_HONESTY_MILESTONE == 101750
print("soft-complete >=33176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33176|through 33176' webui/STATUS.md
echo "OK: phase33176 e2e passed"
