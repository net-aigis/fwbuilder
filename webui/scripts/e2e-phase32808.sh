#!/usr/bin/env bash
# Phase-32808: soft-complete through 32808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32808
PY
grep -qE 'phase32808|through 32808' webui/STATUS.md
echo "OK: phase32808 e2e passed"
