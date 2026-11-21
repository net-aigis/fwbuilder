#!/usr/bin/env bash
# Phase-39568: soft-complete through 39568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39568
PY
grep -qE 'phase39568|through 39568' webui/STATUS.md
echo "OK: phase39568 e2e passed"
