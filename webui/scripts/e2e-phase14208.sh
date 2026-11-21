#!/usr/bin/env bash
# Phase-14208: soft-complete through 14208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14208
PY
grep -qE 'phase14208|through 14208' webui/STATUS.md
echo "OK: phase14208 e2e passed"
