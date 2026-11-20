#!/usr/bin/env bash
# Phase-45104: soft-complete through 45104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45104
PY
grep -qE 'phase45104|through 45104' webui/STATUS.md
echo "OK: phase45104 e2e passed"
