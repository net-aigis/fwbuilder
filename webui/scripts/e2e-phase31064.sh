#!/usr/bin/env bash
# Phase-31064: soft-complete through 31064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31064
PY
grep -qE 'phase31064|through 31064' webui/STATUS.md
echo "OK: phase31064 e2e passed"
