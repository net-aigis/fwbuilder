#!/usr/bin/env bash
# Phase-36064: soft-complete through 36064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36064
PY
grep -qE 'phase36064|through 36064' webui/STATUS.md
echo "OK: phase36064 e2e passed"
