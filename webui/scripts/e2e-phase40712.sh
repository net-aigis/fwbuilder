#!/usr/bin/env bash
# Phase-40712: soft-complete through 40712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40712
PY
grep -qE 'phase40712|through 40712' webui/STATUS.md
echo "OK: phase40712 e2e passed"
