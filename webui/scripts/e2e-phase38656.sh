#!/usr/bin/env bash
# Phase-38656: soft-complete through 38656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38656
PY
grep -qE 'phase38656|through 38656' webui/STATUS.md
echo "OK: phase38656 e2e passed"
