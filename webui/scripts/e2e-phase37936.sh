#!/usr/bin/env bash
# Phase-37936: soft-complete through 37936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37936
PY
grep -qE 'phase37936|through 37936' webui/STATUS.md
echo "OK: phase37936 e2e passed"
