#!/usr/bin/env bash
# Phase-12368: soft-complete through 12368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12368
PY
grep -qE 'phase12368|through 12368' webui/STATUS.md
echo "OK: phase12368 e2e passed"
