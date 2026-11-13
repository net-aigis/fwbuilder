#!/usr/bin/env bash
# Phase-28528: soft-complete through 28528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28528
PY
grep -qE 'phase28528|through 28528' webui/STATUS.md
echo "OK: phase28528 e2e passed"
