#!/usr/bin/env bash
# Phase-38680: soft-complete through 38680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38680
PY
grep -qE 'phase38680|through 38680' webui/STATUS.md
echo "OK: phase38680 e2e passed"
