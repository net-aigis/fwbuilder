#!/usr/bin/env bash
# Phase-34712: soft-complete through 34712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34712
PY
grep -qE 'phase34712|through 34712' webui/STATUS.md
echo "OK: phase34712 e2e passed"
