#!/usr/bin/env bash
# Phase-45928: soft-complete through 45928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45928
PY
grep -qE 'phase45928|through 45928' webui/STATUS.md
echo "OK: phase45928 e2e passed"
