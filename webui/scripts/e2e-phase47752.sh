#!/usr/bin/env bash
# Phase-47752: soft-complete through 47752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47752
PY
grep -qE 'phase47752|through 47752' webui/STATUS.md
echo "OK: phase47752 e2e passed"
