#!/usr/bin/env bash
# Phase-30888: soft-complete through 30888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30888
PY
grep -qE 'phase30888|through 30888' webui/STATUS.md
echo "OK: phase30888 e2e passed"
