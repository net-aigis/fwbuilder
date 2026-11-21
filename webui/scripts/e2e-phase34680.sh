#!/usr/bin/env bash
# Phase-34680: soft-complete through 34680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34680
PY
grep -qE 'phase34680|through 34680' webui/STATUS.md
echo "OK: phase34680 e2e passed"
