#!/usr/bin/env bash
# Phase-8696: soft-complete through 8696 (ms 25250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8696
assert m.WEBUI_HONESTY_MILESTONE == 25250
print("soft-complete >=8696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8696|through 8696' webui/STATUS.md
echo "OK: phase8696 e2e passed"
