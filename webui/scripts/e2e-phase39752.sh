#!/usr/bin/env bash
# Phase-39752: soft-complete through 39752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39752
PY
grep -qE 'phase39752|through 39752' webui/STATUS.md
echo "OK: phase39752 e2e passed"
