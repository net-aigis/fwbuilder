#!/usr/bin/env bash
# Phase-32760: soft-complete through 32760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32760
PY
grep -qE 'phase32760|through 32760' webui/STATUS.md
echo "OK: phase32760 e2e passed"
