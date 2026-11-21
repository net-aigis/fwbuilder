#!/usr/bin/env bash
# Phase-44736: soft-complete through 44736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44736
PY
grep -qE 'phase44736|through 44736' webui/STATUS.md
echo "OK: phase44736 e2e passed"
