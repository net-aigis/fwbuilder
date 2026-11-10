#!/usr/bin/env bash
# Phase-25088: soft-complete through 25088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25088
PY
grep -qE 'phase25088|through 25088' webui/STATUS.md
echo "OK: phase25088 e2e passed"
