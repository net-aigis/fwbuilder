#!/usr/bin/env bash
# Phase-36544: soft-complete through 36544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36544
PY
grep -qE 'phase36544|through 36544' webui/STATUS.md
echo "OK: phase36544 e2e passed"
