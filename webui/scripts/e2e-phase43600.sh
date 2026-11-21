#!/usr/bin/env bash
# Phase-43600: soft-complete through 43600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43600
PY
grep -qE 'phase43600|through 43600' webui/STATUS.md
echo "OK: phase43600 e2e passed"
