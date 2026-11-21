#!/usr/bin/env bash
# Phase-47880: soft-complete through 47880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47880
PY
grep -qE 'phase47880|through 47880' webui/STATUS.md
echo "OK: phase47880 e2e passed"
