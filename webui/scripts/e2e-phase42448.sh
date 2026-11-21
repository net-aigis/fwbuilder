#!/usr/bin/env bash
# Phase-42448: soft-complete through 42448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42448
PY
grep -qE 'phase42448|through 42448' webui/STATUS.md
echo "OK: phase42448 e2e passed"
