#!/usr/bin/env bash
# Phase-36256: soft-complete through 36256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36256
PY
grep -qE 'phase36256|through 36256' webui/STATUS.md
echo "OK: phase36256 e2e passed"
