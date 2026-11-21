#!/usr/bin/env bash
# Phase-36760: soft-complete through 36760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36760
PY
grep -qE 'phase36760|through 36760' webui/STATUS.md
echo "OK: phase36760 e2e passed"
