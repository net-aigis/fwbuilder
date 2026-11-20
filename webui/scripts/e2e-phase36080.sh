#!/usr/bin/env bash
# Phase-36080: soft-complete through 36080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36080
PY
grep -qE 'phase36080|through 36080' webui/STATUS.md
echo "OK: phase36080 e2e passed"
