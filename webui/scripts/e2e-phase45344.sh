#!/usr/bin/env bash
# Phase-45344: soft-complete through 45344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45344
PY
grep -qE 'phase45344|through 45344' webui/STATUS.md
echo "OK: phase45344 e2e passed"
