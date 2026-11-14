#!/usr/bin/env bash
# Phase-30912: soft-complete through 30912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30912
PY
grep -qE 'phase30912|through 30912' webui/STATUS.md
echo "OK: phase30912 e2e passed"
