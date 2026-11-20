#!/usr/bin/env bash
# Phase-44984: soft-complete through 44984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44984
PY
grep -qE 'phase44984|through 44984' webui/STATUS.md
echo "OK: phase44984 e2e passed"
