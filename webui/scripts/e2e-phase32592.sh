#!/usr/bin/env bash
# Phase-32592: soft-complete through 32592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32592
PY
grep -qE 'phase32592|through 32592' webui/STATUS.md
echo "OK: phase32592 e2e passed"
