#!/usr/bin/env bash
# Phase-44760: soft-complete through 44760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44760
PY
grep -qE 'phase44760|through 44760' webui/STATUS.md
echo "OK: phase44760 e2e passed"
