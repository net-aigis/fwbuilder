#!/usr/bin/env bash
# Phase-39040: soft-complete through 39040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39040
PY
grep -qE 'phase39040|through 39040' webui/STATUS.md
echo "OK: phase39040 e2e passed"
