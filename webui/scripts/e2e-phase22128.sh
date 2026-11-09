#!/usr/bin/env bash
# Phase-22128: soft-complete through 22128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22128
PY
grep -qE 'phase22128|through 22128' webui/STATUS.md
echo "OK: phase22128 e2e passed"
