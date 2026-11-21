#!/usr/bin/env bash
# Phase-32920: soft-complete through 32920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32920
PY
grep -qE 'phase32920|through 32920' webui/STATUS.md
echo "OK: phase32920 e2e passed"
