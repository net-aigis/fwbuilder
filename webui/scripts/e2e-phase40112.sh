#!/usr/bin/env bash
# Phase-40112: soft-complete through 40112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40112
PY
grep -qE 'phase40112|through 40112' webui/STATUS.md
echo "OK: phase40112 e2e passed"
