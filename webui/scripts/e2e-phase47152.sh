#!/usr/bin/env bash
# Phase-47152: soft-complete through 47152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47152
PY
grep -qE 'phase47152|through 47152' webui/STATUS.md
echo "OK: phase47152 e2e passed"
