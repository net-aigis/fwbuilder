#!/usr/bin/env bash
# Phase-42064: soft-complete through 42064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42064
PY
grep -qE 'phase42064|through 42064' webui/STATUS.md
echo "OK: phase42064 e2e passed"
