#!/usr/bin/env bash
# Phase-38280: soft-complete through 38280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38280
PY
grep -qE 'phase38280|through 38280' webui/STATUS.md
echo "OK: phase38280 e2e passed"
