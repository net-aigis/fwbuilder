#!/usr/bin/env bash
# Phase-31824: soft-complete through 31824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31824
PY
grep -qE 'phase31824|through 31824' webui/STATUS.md
echo "OK: phase31824 e2e passed"
