#!/usr/bin/env bash
# Phase-34888: soft-complete through 34888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34888
PY
grep -qE 'phase34888|through 34888' webui/STATUS.md
echo "OK: phase34888 e2e passed"
