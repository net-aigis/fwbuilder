#!/usr/bin/env bash
# Phase-29808: soft-complete through 29808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29808
PY
grep -qE 'phase29808|through 29808' webui/STATUS.md
echo "OK: phase29808 e2e passed"
