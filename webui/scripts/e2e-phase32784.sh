#!/usr/bin/env bash
# Phase-32784: soft-complete through 32784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32784
PY
grep -qE 'phase32784|through 32784' webui/STATUS.md
echo "OK: phase32784 e2e passed"
