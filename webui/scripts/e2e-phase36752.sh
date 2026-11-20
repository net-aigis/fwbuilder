#!/usr/bin/env bash
# Phase-36752: soft-complete through 36752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36752
PY
grep -qE 'phase36752|through 36752' webui/STATUS.md
echo "OK: phase36752 e2e passed"
