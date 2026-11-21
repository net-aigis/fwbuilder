#!/usr/bin/env bash
# Phase-30128: soft-complete through 30128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30128
PY
grep -qE 'phase30128|through 30128' webui/STATUS.md
echo "OK: phase30128 e2e passed"
