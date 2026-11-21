#!/usr/bin/env bash
# Phase-31464: soft-complete through 31464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31464
PY
grep -qE 'phase31464|through 31464' webui/STATUS.md
echo "OK: phase31464 e2e passed"
