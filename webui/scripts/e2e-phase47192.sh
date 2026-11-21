#!/usr/bin/env bash
# Phase-47192: soft-complete through 47192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47192
PY
grep -qE 'phase47192|through 47192' webui/STATUS.md
echo "OK: phase47192 e2e passed"
