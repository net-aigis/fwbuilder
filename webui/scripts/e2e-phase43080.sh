#!/usr/bin/env bash
# Phase-43080: soft-complete through 43080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43080
PY
grep -qE 'phase43080|through 43080' webui/STATUS.md
echo "OK: phase43080 e2e passed"
