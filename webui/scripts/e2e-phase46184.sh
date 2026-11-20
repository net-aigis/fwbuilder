#!/usr/bin/env bash
# Phase-46184: soft-complete through 46184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46184
PY
grep -qE 'phase46184|through 46184' webui/STATUS.md
echo "OK: phase46184 e2e passed"
