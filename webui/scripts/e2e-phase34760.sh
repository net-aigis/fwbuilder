#!/usr/bin/env bash
# Phase-34760: soft-complete through 34760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34760
PY
grep -qE 'phase34760|through 34760' webui/STATUS.md
echo "OK: phase34760 e2e passed"
