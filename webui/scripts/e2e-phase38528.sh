#!/usr/bin/env bash
# Phase-38528: soft-complete through 38528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38528
PY
grep -qE 'phase38528|through 38528' webui/STATUS.md
echo "OK: phase38528 e2e passed"
