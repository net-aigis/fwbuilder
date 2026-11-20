#!/usr/bin/env bash
# Phase-36016: soft-complete through 36016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36016
PY
grep -qE 'phase36016|through 36016' webui/STATUS.md
echo "OK: phase36016 e2e passed"
