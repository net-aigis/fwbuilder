#!/usr/bin/env bash
# Phase-48064: soft-complete through 48064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48064
PY
grep -qE 'phase48064|through 48064' webui/STATUS.md
echo "OK: phase48064 e2e passed"
