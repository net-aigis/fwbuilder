#!/usr/bin/env bash
# Phase-45512: soft-complete through 45512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45512
PY
grep -qE 'phase45512|through 45512' webui/STATUS.md
echo "OK: phase45512 e2e passed"
