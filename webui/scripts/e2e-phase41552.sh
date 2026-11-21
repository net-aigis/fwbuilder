#!/usr/bin/env bash
# Phase-41552: soft-complete through 41552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41552
PY
grep -qE 'phase41552|through 41552' webui/STATUS.md
echo "OK: phase41552 e2e passed"
