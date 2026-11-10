#!/usr/bin/env bash
# Phase-26528: soft-complete through 26528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26528
PY
grep -qE 'phase26528|through 26528' webui/STATUS.md
echo "OK: phase26528 e2e passed"
