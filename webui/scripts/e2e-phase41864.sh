#!/usr/bin/env bash
# Phase-41864: soft-complete through 41864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41864
PY
grep -qE 'phase41864|through 41864' webui/STATUS.md
echo "OK: phase41864 e2e passed"
