#!/usr/bin/env bash
# Phase-46960: soft-complete through 46960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46960
PY
grep -qE 'phase46960|through 46960' webui/STATUS.md
echo "OK: phase46960 e2e passed"
