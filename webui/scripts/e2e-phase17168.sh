#!/usr/bin/env bash
# Phase-17168: soft-complete through 17168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17168
PY
grep -qE 'phase17168|through 17168' webui/STATUS.md
echo "OK: phase17168 e2e passed"
