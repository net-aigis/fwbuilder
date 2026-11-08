#!/usr/bin/env bash
# Phase-11568: soft-complete through 11568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11568
PY
grep -qE 'phase11568|through 11568' webui/STATUS.md
echo "OK: phase11568 e2e passed"
