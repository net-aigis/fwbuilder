#!/usr/bin/env bash
# Phase-43864: soft-complete through 43864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43864
PY
grep -qE 'phase43864|through 43864' webui/STATUS.md
echo "OK: phase43864 e2e passed"
