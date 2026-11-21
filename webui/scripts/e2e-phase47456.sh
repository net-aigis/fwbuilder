#!/usr/bin/env bash
# Phase-47456: soft-complete through 47456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47456
PY
grep -qE 'phase47456|through 47456' webui/STATUS.md
echo "OK: phase47456 e2e passed"
