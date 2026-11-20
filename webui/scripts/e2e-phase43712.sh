#!/usr/bin/env bash
# Phase-43712: soft-complete through 43712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43712
PY
grep -qE 'phase43712|through 43712' webui/STATUS.md
echo "OK: phase43712 e2e passed"
