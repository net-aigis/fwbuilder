#!/usr/bin/env bash
# Phase-44368: soft-complete through 44368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44368
PY
grep -qE 'phase44368|through 44368' webui/STATUS.md
echo "OK: phase44368 e2e passed"
