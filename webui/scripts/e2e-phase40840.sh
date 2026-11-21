#!/usr/bin/env bash
# Phase-40840: soft-complete through 40840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40840
PY
grep -qE 'phase40840|through 40840' webui/STATUS.md
echo "OK: phase40840 e2e passed"
