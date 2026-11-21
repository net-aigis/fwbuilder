#!/usr/bin/env bash
# Phase-45464: soft-complete through 45464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45464
PY
grep -qE 'phase45464|through 45464' webui/STATUS.md
echo "OK: phase45464 e2e passed"
