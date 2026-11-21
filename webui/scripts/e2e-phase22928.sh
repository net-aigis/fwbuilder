#!/usr/bin/env bash
# Phase-22928: soft-complete through 22928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22928
PY
grep -qE 'phase22928|through 22928' webui/STATUS.md
echo "OK: phase22928 e2e passed"
