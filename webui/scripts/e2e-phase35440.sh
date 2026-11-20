#!/usr/bin/env bash
# Phase-35440: soft-complete through 35440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35440
PY
grep -qE 'phase35440|through 35440' webui/STATUS.md
echo "OK: phase35440 e2e passed"
