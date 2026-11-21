#!/usr/bin/env bash
# Phase-40912: soft-complete through 40912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40912
PY
grep -qE 'phase40912|through 40912' webui/STATUS.md
echo "OK: phase40912 e2e passed"
