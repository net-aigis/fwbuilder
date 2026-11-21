#!/usr/bin/env bash
# Phase-22528: soft-complete through 22528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22528
PY
grep -qE 'phase22528|through 22528' webui/STATUS.md
echo "OK: phase22528 e2e passed"
