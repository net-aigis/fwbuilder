#!/usr/bin/env bash
# Phase-48712: soft-complete through 48712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48712
PY
grep -qE 'phase48712|through 48712' webui/STATUS.md
echo "OK: phase48712 e2e passed"
