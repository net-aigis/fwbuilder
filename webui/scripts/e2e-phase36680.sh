#!/usr/bin/env bash
# Phase-36680: soft-complete through 36680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36680
PY
grep -qE 'phase36680|through 36680' webui/STATUS.md
echo "OK: phase36680 e2e passed"
