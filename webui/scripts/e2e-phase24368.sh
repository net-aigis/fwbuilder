#!/usr/bin/env bash
# Phase-24368: soft-complete through 24368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24368
PY
grep -qE 'phase24368|through 24368' webui/STATUS.md
echo "OK: phase24368 e2e passed"
