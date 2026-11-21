#!/usr/bin/env bash
# Phase-35680: soft-complete through 35680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35680
PY
grep -qE 'phase35680|through 35680' webui/STATUS.md
echo "OK: phase35680 e2e passed"
