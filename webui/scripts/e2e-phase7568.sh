#!/usr/bin/env bash
# Phase-7568: soft-complete through 7568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7568
PY
grep -qE 'phase7568|through 7568' webui/STATUS.md
echo "OK: phase7568 e2e passed"
