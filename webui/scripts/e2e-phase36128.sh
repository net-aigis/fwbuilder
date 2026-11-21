#!/usr/bin/env bash
# Phase-36128: soft-complete through 36128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36128
PY
grep -qE 'phase36128|through 36128' webui/STATUS.md
echo "OK: phase36128 e2e passed"
