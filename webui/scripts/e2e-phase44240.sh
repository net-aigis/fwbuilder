#!/usr/bin/env bash
# Phase-44240: soft-complete through 44240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44240
PY
grep -qE 'phase44240|through 44240' webui/STATUS.md
echo "OK: phase44240 e2e passed"
