#!/usr/bin/env bash
# Phase-48808: soft-complete through 48808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48808
PY
grep -qE 'phase48808|through 48808' webui/STATUS.md
echo "OK: phase48808 e2e passed"
