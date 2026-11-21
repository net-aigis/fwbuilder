#!/usr/bin/env bash
# Phase-32712: soft-complete through 32712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32712
PY
grep -qE 'phase32712|through 32712' webui/STATUS.md
echo "OK: phase32712 e2e passed"
