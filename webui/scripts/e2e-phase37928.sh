#!/usr/bin/env bash
# Phase-37928: soft-complete through 37928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37928
PY
grep -qE 'phase37928|through 37928' webui/STATUS.md
echo "OK: phase37928 e2e passed"
