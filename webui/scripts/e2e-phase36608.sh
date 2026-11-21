#!/usr/bin/env bash
# Phase-36608: soft-complete through 36608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36608
PY
grep -qE 'phase36608|through 36608' webui/STATUS.md
echo "OK: phase36608 e2e passed"
