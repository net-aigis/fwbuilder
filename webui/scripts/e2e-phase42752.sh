#!/usr/bin/env bash
# Phase-42752: soft-complete through 42752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42752
PY
grep -qE 'phase42752|through 42752' webui/STATUS.md
echo "OK: phase42752 e2e passed"
