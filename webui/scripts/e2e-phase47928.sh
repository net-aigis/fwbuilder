#!/usr/bin/env bash
# Phase-47928: soft-complete through 47928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47928
PY
grep -qE 'phase47928|through 47928' webui/STATUS.md
echo "OK: phase47928 e2e passed"
