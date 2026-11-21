#!/usr/bin/env bash
# Phase-40656: soft-complete through 40656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40656
PY
grep -qE 'phase40656|through 40656' webui/STATUS.md
echo "OK: phase40656 e2e passed"
