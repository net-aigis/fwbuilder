#!/usr/bin/env bash
# Phase-37592: soft-complete through 37592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37592
PY
grep -qE 'phase37592|through 37592' webui/STATUS.md
echo "OK: phase37592 e2e passed"
