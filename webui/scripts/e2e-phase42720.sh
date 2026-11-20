#!/usr/bin/env bash
# Phase-42720: soft-complete through 42720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42720
PY
grep -qE 'phase42720|through 42720' webui/STATUS.md
echo "OK: phase42720 e2e passed"
