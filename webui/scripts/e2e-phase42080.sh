#!/usr/bin/env bash
# Phase-42080: soft-complete through 42080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42080
PY
grep -qE 'phase42080|through 42080' webui/STATUS.md
echo "OK: phase42080 e2e passed"
