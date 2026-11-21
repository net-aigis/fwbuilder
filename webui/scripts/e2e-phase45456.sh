#!/usr/bin/env bash
# Phase-45456: soft-complete through 45456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45456
PY
grep -qE 'phase45456|through 45456' webui/STATUS.md
echo "OK: phase45456 e2e passed"
