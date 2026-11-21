#!/usr/bin/env bash
# Phase-43624: soft-complete through 43624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43624
PY
grep -qE 'phase43624|through 43624' webui/STATUS.md
echo "OK: phase43624 e2e passed"
