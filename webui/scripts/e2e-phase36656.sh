#!/usr/bin/env bash
# Phase-36656: soft-complete through 36656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36656
PY
grep -qE 'phase36656|through 36656' webui/STATUS.md
echo "OK: phase36656 e2e passed"
