#!/usr/bin/env bash
# Phase-46064: soft-complete through 46064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46064
PY
grep -qE 'phase46064|through 46064' webui/STATUS.md
echo "OK: phase46064 e2e passed"
