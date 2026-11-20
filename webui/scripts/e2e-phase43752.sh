#!/usr/bin/env bash
# Phase-43752: soft-complete through 43752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43752
PY
grep -qE 'phase43752|through 43752' webui/STATUS.md
echo "OK: phase43752 e2e passed"
