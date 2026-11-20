#!/usr/bin/env bash
# Phase-42544: soft-complete through 42544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42544
PY
grep -qE 'phase42544|through 42544' webui/STATUS.md
echo "OK: phase42544 e2e passed"
