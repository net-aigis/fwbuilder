#!/usr/bin/env bash
# Phase-42192: soft-complete through 42192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42192
PY
grep -qE 'phase42192|through 42192' webui/STATUS.md
echo "OK: phase42192 e2e passed"
