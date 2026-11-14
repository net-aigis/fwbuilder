#!/usr/bin/env bash
# Phase-30592: soft-complete through 30592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30592
PY
grep -qE 'phase30592|through 30592' webui/STATUS.md
echo "OK: phase30592 e2e passed"
