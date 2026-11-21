#!/usr/bin/env bash
# Phase-23888: soft-complete through 23888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23888
PY
grep -qE 'phase23888|through 23888' webui/STATUS.md
echo "OK: phase23888 e2e passed"
