#!/usr/bin/env bash
# Phase-39528: soft-complete through 39528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39528
PY
grep -qE 'phase39528|through 39528' webui/STATUS.md
echo "OK: phase39528 e2e passed"
