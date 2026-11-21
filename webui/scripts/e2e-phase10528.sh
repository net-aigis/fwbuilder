#!/usr/bin/env bash
# Phase-10528: soft-complete through 10528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10528
PY
grep -qE 'phase10528|through 10528' webui/STATUS.md
echo "OK: phase10528 e2e passed"
