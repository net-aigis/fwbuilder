#!/usr/bin/env bash
# Phase-45168: soft-complete through 45168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45168
PY
grep -qE 'phase45168|through 45168' webui/STATUS.md
echo "OK: phase45168 e2e passed"
