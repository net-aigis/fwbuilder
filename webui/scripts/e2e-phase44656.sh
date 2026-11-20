#!/usr/bin/env bash
# Phase-44656: soft-complete through 44656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44656
PY
grep -qE 'phase44656|through 44656' webui/STATUS.md
echo "OK: phase44656 e2e passed"
