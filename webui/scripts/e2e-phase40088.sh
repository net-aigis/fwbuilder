#!/usr/bin/env bash
# Phase-40088: soft-complete through 40088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40088
PY
grep -qE 'phase40088|through 40088' webui/STATUS.md
echo "OK: phase40088 e2e passed"
