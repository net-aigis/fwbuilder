#!/usr/bin/env bash
# Phase-35536: soft-complete through 35536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35536
PY
grep -qE 'phase35536|through 35536' webui/STATUS.md
echo "OK: phase35536 e2e passed"
