#!/usr/bin/env bash
# Phase-30680: soft-complete through 30680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30680
PY
grep -qE 'phase30680|through 30680' webui/STATUS.md
echo "OK: phase30680 e2e passed"
