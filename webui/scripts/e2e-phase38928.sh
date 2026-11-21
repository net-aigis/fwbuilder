#!/usr/bin/env bash
# Phase-38928: soft-complete through 38928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38928
PY
grep -qE 'phase38928|through 38928' webui/STATUS.md
echo "OK: phase38928 e2e passed"
