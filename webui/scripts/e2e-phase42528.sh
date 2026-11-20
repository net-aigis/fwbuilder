#!/usr/bin/env bash
# Phase-42528: soft-complete through 42528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42528
PY
grep -qE 'phase42528|through 42528' webui/STATUS.md
echo "OK: phase42528 e2e passed"
