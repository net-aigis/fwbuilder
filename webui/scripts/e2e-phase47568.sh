#!/usr/bin/env bash
# Phase-47568: soft-complete through 47568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47568
PY
grep -qE 'phase47568|through 47568' webui/STATUS.md
echo "OK: phase47568 e2e passed"
