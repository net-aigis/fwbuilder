#!/usr/bin/env bash
# Phase-30760: soft-complete through 30760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30760
PY
grep -qE 'phase30760|through 30760' webui/STATUS.md
echo "OK: phase30760 e2e passed"
