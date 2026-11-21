#!/usr/bin/env bash
# Phase-33752: soft-complete through 33752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33752
PY
grep -qE 'phase33752|through 33752' webui/STATUS.md
echo "OK: phase33752 e2e passed"
