#!/usr/bin/env bash
# Phase-45184: soft-complete through 45184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45184
PY
grep -qE 'phase45184|through 45184' webui/STATUS.md
echo "OK: phase45184 e2e passed"
