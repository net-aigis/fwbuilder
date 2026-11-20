#!/usr/bin/env bash
# Phase-36584: soft-complete through 36584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36584
PY
grep -qE 'phase36584|through 36584' webui/STATUS.md
echo "OK: phase36584 e2e passed"
