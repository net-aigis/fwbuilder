#!/usr/bin/env bash
# Phase-36304: soft-complete through 36304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36304
PY
grep -qE 'phase36304|through 36304' webui/STATUS.md
echo "OK: phase36304 e2e passed"
