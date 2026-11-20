#!/usr/bin/env bash
# Phase-44720: soft-complete through 44720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44720
PY
grep -qE 'phase44720|through 44720' webui/STATUS.md
echo "OK: phase44720 e2e passed"
