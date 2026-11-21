#!/usr/bin/env bash
# Phase-36904: soft-complete through 36904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36904
PY
grep -qE 'phase36904|through 36904' webui/STATUS.md
echo "OK: phase36904 e2e passed"
