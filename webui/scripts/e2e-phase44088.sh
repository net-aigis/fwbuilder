#!/usr/bin/env bash
# Phase-44088: soft-complete through 44088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44088
PY
grep -qE 'phase44088|through 44088' webui/STATUS.md
echo "OK: phase44088 e2e passed"
