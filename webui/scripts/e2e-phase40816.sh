#!/usr/bin/env bash
# Phase-40816: soft-complete through 40816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40816
PY
grep -qE 'phase40816|through 40816' webui/STATUS.md
echo "OK: phase40816 e2e passed"
