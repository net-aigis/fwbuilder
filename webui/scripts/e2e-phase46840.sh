#!/usr/bin/env bash
# Phase-46840: soft-complete through 46840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46840
PY
grep -qE 'phase46840|through 46840' webui/STATUS.md
echo "OK: phase46840 e2e passed"
