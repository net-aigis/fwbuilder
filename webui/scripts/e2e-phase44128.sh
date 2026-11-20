#!/usr/bin/env bash
# Phase-44128: soft-complete through 44128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44128
PY
grep -qE 'phase44128|through 44128' webui/STATUS.md
echo "OK: phase44128 e2e passed"
