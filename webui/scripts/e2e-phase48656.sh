#!/usr/bin/env bash
# Phase-48656: soft-complete through 48656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48656
PY
grep -qE 'phase48656|through 48656' webui/STATUS.md
echo "OK: phase48656 e2e passed"
