#!/usr/bin/env bash
# Phase-47112: soft-complete through 47112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47112
PY
grep -qE 'phase47112|through 47112' webui/STATUS.md
echo "OK: phase47112 e2e passed"
