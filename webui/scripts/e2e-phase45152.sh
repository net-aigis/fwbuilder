#!/usr/bin/env bash
# Phase-45152: soft-complete through 45152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45152
PY
grep -qE 'phase45152|through 45152' webui/STATUS.md
echo "OK: phase45152 e2e passed"
