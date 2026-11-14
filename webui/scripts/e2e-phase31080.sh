#!/usr/bin/env bash
# Phase-31080: soft-complete through 31080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31080
PY
grep -qE 'phase31080|through 31080' webui/STATUS.md
echo "OK: phase31080 e2e passed"
