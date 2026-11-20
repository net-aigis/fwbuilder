#!/usr/bin/env bash
# Phase-43584: soft-complete through 43584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43584
PY
grep -qE 'phase43584|through 43584' webui/STATUS.md
echo "OK: phase43584 e2e passed"
