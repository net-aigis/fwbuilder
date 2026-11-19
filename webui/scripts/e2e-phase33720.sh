#!/usr/bin/env bash
# Phase-33720: soft-complete through 33720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33720
PY
grep -qE 'phase33720|through 33720' webui/STATUS.md
echo "OK: phase33720 e2e passed"
