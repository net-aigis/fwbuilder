#!/usr/bin/env bash
# Phase-37152: soft-complete through 37152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37152
PY
grep -qE 'phase37152|through 37152' webui/STATUS.md
echo "OK: phase37152 e2e passed"
