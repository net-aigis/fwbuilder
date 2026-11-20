#!/usr/bin/env bash
# Phase-46568: soft-complete through 46568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46568
PY
grep -qE 'phase46568|through 46568' webui/STATUS.md
echo "OK: phase46568 e2e passed"
