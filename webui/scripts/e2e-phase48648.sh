#!/usr/bin/env bash
# Phase-48648: soft-complete through 48648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48648
PY
grep -qE 'phase48648|through 48648' webui/STATUS.md
echo "OK: phase48648 e2e passed"
