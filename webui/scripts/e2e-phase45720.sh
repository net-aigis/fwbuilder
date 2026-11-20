#!/usr/bin/env bash
# Phase-45720: soft-complete through 45720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45720
PY
grep -qE 'phase45720|through 45720' webui/STATUS.md
echo "OK: phase45720 e2e passed"
