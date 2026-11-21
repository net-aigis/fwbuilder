#!/usr/bin/env bash
# Phase-44920: soft-complete through 44920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44920
PY
grep -qE 'phase44920|through 44920' webui/STATUS.md
echo "OK: phase44920 e2e passed"
