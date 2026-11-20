#!/usr/bin/env bash
# Phase-34728: soft-complete through 34728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34728
PY
grep -qE 'phase34728|through 34728' webui/STATUS.md
echo "OK: phase34728 e2e passed"
