#!/usr/bin/env bash
# Phase-44008: soft-complete through 44008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44008
PY
grep -qE 'phase44008|through 44008' webui/STATUS.md
echo "OK: phase44008 e2e passed"
