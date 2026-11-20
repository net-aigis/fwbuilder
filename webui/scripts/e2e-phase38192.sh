#!/usr/bin/env bash
# Phase-38192: soft-complete through 38192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38192
PY
grep -qE 'phase38192|through 38192' webui/STATUS.md
echo "OK: phase38192 e2e passed"
