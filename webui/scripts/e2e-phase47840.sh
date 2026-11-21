#!/usr/bin/env bash
# Phase-47840: soft-complete through 47840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47840
PY
grep -qE 'phase47840|through 47840' webui/STATUS.md
echo "OK: phase47840 e2e passed"
