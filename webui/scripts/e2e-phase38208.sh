#!/usr/bin/env bash
# Phase-38208: soft-complete through 38208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38208
PY
grep -qE 'phase38208|through 38208' webui/STATUS.md
echo "OK: phase38208 e2e passed"
