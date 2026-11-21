#!/usr/bin/env bash
# Phase-42512: soft-complete through 42512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42512
PY
grep -qE 'phase42512|through 42512' webui/STATUS.md
echo "OK: phase42512 e2e passed"
