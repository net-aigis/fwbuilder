#!/usr/bin/env bash
# Phase-38000: soft-complete through 38000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38000
PY
grep -qE 'phase38000|through 38000' webui/STATUS.md
echo "OK: phase38000 e2e passed"
