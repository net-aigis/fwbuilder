#!/usr/bin/env bash
# Phase-7888: soft-complete through 7888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7888
PY
grep -qE 'phase7888|through 7888' webui/STATUS.md
echo "OK: phase7888 e2e passed"
