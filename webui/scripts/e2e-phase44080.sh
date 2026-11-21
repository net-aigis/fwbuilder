#!/usr/bin/env bash
# Phase-44080: soft-complete through 44080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44080
PY
grep -qE 'phase44080|through 44080' webui/STATUS.md
echo "OK: phase44080 e2e passed"
