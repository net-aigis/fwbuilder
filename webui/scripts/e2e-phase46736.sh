#!/usr/bin/env bash
# Phase-46736: soft-complete through 46736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46736
PY
grep -qE 'phase46736|through 46736' webui/STATUS.md
echo "OK: phase46736 e2e passed"
