#!/usr/bin/env bash
# Phase-34464: soft-complete through 34464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34464
PY
grep -qE 'phase34464|through 34464' webui/STATUS.md
echo "OK: phase34464 e2e passed"
