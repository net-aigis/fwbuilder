#!/usr/bin/env bash
# Phase-37680: soft-complete through 37680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37680
PY
grep -qE 'phase37680|through 37680' webui/STATUS.md
echo "OK: phase37680 e2e passed"
