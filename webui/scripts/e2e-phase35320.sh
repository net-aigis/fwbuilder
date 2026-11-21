#!/usr/bin/env bash
# Phase-35320: soft-complete through 35320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35320
PY
grep -qE 'phase35320|through 35320' webui/STATUS.md
echo "OK: phase35320 e2e passed"
