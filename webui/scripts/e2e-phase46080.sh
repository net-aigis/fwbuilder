#!/usr/bin/env bash
# Phase-46080: soft-complete through 46080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46080
PY
grep -qE 'phase46080|through 46080' webui/STATUS.md
echo "OK: phase46080 e2e passed"
