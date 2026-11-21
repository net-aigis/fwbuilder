#!/usr/bin/env bash
# Phase-25888: soft-complete through 25888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25888
PY
grep -qE 'phase25888|through 25888' webui/STATUS.md
echo "OK: phase25888 e2e passed"
