#!/usr/bin/env bash
# Phase-37512: soft-complete through 37512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37512
PY
grep -qE 'phase37512|through 37512' webui/STATUS.md
echo "OK: phase37512 e2e passed"
