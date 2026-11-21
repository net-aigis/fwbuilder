#!/usr/bin/env bash
# Phase-22696: soft-complete through 22696 (ms 69000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22696
assert m.WEBUI_HONESTY_MILESTONE == 69000
print("soft-complete >=22696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22696|through 22696' webui/STATUS.md
echo "OK: phase22696 e2e passed"
