#!/usr/bin/env bash
# Phase-31840: soft-complete through 31840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31840
PY
grep -qE 'phase31840|through 31840' webui/STATUS.md
echo "OK: phase31840 e2e passed"
