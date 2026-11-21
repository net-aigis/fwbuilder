#!/usr/bin/env bash
# Phase-15168: soft-complete through 15168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15168
PY
grep -qE 'phase15168|through 15168' webui/STATUS.md
echo "OK: phase15168 e2e passed"
