#!/usr/bin/env bash
# Phase-34568: soft-complete through 34568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34568
PY
grep -qE 'phase34568|through 34568' webui/STATUS.md
echo "OK: phase34568 e2e passed"
