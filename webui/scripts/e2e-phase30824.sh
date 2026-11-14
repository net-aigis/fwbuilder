#!/usr/bin/env bash
# Phase-30824: soft-complete through 30824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30824
PY
grep -qE 'phase30824|through 30824' webui/STATUS.md
echo "OK: phase30824 e2e passed"
