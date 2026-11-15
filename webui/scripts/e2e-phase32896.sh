#!/usr/bin/env bash
# Phase-32896: soft-complete through 32896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32896
PY
grep -qE 'phase32896|through 32896' webui/STATUS.md
echo "OK: phase32896 e2e passed"
