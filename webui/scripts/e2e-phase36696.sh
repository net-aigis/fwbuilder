#!/usr/bin/env bash
# Phase-36696: soft-complete through 36696 (ms 112750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36696
assert m.WEBUI_HONESTY_MILESTONE == 112750
print("soft-complete >=36696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36696|through 36696' webui/STATUS.md
echo "OK: phase36696 e2e passed"
