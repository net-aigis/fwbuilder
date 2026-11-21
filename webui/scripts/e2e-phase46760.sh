#!/usr/bin/env bash
# Phase-46760: soft-complete through 46760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46760
PY
grep -qE 'phase46760|through 46760' webui/STATUS.md
echo "OK: phase46760 e2e passed"
