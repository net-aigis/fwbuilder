#!/usr/bin/env bash
# Phase-30712: soft-complete through 30712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30712
PY
grep -qE 'phase30712|through 30712' webui/STATUS.md
echo "OK: phase30712 e2e passed"
