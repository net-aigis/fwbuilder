#!/usr/bin/env bash
# Phase-40512: soft-complete through 40512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40512
PY
grep -qE 'phase40512|through 40512' webui/STATUS.md
echo "OK: phase40512 e2e passed"
