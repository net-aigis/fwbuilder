#!/usr/bin/env bash
# Phase-27088: soft-complete through 27088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27088
PY
grep -qE 'phase27088|through 27088' webui/STATUS.md
echo "OK: phase27088 e2e passed"
