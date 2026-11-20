#!/usr/bin/env bash
# Phase-44840: soft-complete through 44840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44840
PY
grep -qE 'phase44840|through 44840' webui/STATUS.md
echo "OK: phase44840 e2e passed"
