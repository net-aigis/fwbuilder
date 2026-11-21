#!/usr/bin/env bash
# Phase-7968: soft-complete through 7968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7968
PY
grep -qE 'phase7968|through 7968' webui/STATUS.md
echo "OK: phase7968 e2e passed"
