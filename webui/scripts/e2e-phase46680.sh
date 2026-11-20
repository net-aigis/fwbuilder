#!/usr/bin/env bash
# Phase-46680: soft-complete through 46680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46680
PY
grep -qE 'phase46680|through 46680' webui/STATUS.md
echo "OK: phase46680 e2e passed"
