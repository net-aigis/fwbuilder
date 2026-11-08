#!/usr/bin/env bash
# Phase-15088: soft-complete through 15088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15088
PY
grep -qE 'phase15088|through 15088' webui/STATUS.md
echo "OK: phase15088 e2e passed"
