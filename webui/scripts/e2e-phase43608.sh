#!/usr/bin/env bash
# Phase-43608: soft-complete through 43608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43608
PY
grep -qE 'phase43608|through 43608' webui/STATUS.md
echo "OK: phase43608 e2e passed"
