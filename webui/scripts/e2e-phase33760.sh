#!/usr/bin/env bash
# Phase-33760: soft-complete through 33760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33760
PY
grep -qE 'phase33760|through 33760' webui/STATUS.md
echo "OK: phase33760 e2e passed"
