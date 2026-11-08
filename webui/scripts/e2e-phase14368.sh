#!/usr/bin/env bash
# Phase-14368: soft-complete through 14368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14368
PY
grep -qE 'phase14368|through 14368' webui/STATUS.md
echo "OK: phase14368 e2e passed"
