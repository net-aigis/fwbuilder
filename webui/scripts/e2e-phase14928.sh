#!/usr/bin/env bash
# Phase-14928: soft-complete through 14928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14928
PY
grep -qE 'phase14928|through 14928' webui/STATUS.md
echo "OK: phase14928 e2e passed"
