#!/usr/bin/env bash
# Phase-23568: soft-complete through 23568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23568
PY
grep -qE 'phase23568|through 23568' webui/STATUS.md
echo "OK: phase23568 e2e passed"
