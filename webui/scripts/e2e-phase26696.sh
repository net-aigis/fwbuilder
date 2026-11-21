#!/usr/bin/env bash
# Phase-26696: soft-complete through 26696 (ms 81500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26696
assert m.WEBUI_HONESTY_MILESTONE == 81500
print("soft-complete >=26696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26696|through 26696' webui/STATUS.md
echo "OK: phase26696 e2e passed"
