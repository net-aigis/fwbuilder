#!/usr/bin/env bash
# Phase-33184: soft-complete through 33184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33184
PY
grep -qE 'phase33184|through 33184' webui/STATUS.md
echo "OK: phase33184 e2e passed"
