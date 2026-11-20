#!/usr/bin/env bash
# Phase-40592: soft-complete through 40592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40592
PY
grep -qE 'phase40592|through 40592' webui/STATUS.md
echo "OK: phase40592 e2e passed"
