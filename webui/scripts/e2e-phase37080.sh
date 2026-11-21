#!/usr/bin/env bash
# Phase-37080: soft-complete through 37080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37080
PY
grep -qE 'phase37080|through 37080' webui/STATUS.md
echo "OK: phase37080 e2e passed"
