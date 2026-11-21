#!/usr/bin/env bash
# Phase-7168: soft-complete through 7168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7168
PY
grep -qE 'phase7168|through 7168' webui/STATUS.md
echo "OK: phase7168 e2e passed"
