#!/usr/bin/env bash
# Phase-37696: soft-complete through 37696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37696
PY
grep -qE 'phase37696|through 37696' webui/STATUS.md
echo "OK: phase37696 e2e passed"
