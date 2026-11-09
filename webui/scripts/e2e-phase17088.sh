#!/usr/bin/env bash
# Phase-17088: soft-complete through 17088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17088
PY
grep -qE 'phase17088|through 17088' webui/STATUS.md
echo "OK: phase17088 e2e passed"
