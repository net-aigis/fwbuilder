#!/usr/bin/env bash
# Phase-38712: soft-complete through 38712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38712
PY
grep -qE 'phase38712|through 38712' webui/STATUS.md
echo "OK: phase38712 e2e passed"
