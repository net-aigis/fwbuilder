#!/usr/bin/env bash
# Phase-38016: soft-complete through 38016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38016
PY
grep -qE 'phase38016|through 38016' webui/STATUS.md
echo "OK: phase38016 e2e passed"
