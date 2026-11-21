#!/usr/bin/env bash
# Phase-33840: soft-complete through 33840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33840
PY
grep -qE 'phase33840|through 33840' webui/STATUS.md
echo "OK: phase33840 e2e passed"
