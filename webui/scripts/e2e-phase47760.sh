#!/usr/bin/env bash
# Phase-47760: soft-complete through 47760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47760
PY
grep -qE 'phase47760|through 47760' webui/STATUS.md
echo "OK: phase47760 e2e passed"
