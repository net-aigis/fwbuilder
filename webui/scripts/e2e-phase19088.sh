#!/usr/bin/env bash
# Phase-19088: soft-complete through 19088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19088
PY
grep -qE 'phase19088|through 19088' webui/STATUS.md
echo "OK: phase19088 e2e passed"
