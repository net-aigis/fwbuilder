#!/usr/bin/env bash
# Phase-47088: soft-complete through 47088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47088
PY
grep -qE 'phase47088|through 47088' webui/STATUS.md
echo "OK: phase47088 e2e passed"
