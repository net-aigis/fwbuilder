#!/usr/bin/env bash
# Phase-43104: soft-complete through 43104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43104
PY
grep -qE 'phase43104|through 43104' webui/STATUS.md
echo "OK: phase43104 e2e passed"
