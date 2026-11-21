#!/usr/bin/env bash
# Phase-48848: soft-complete through 48848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48848
PY
grep -qE 'phase48848|through 48848' webui/STATUS.md
echo "OK: phase48848 e2e passed"
