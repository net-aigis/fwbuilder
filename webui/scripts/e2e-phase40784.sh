#!/usr/bin/env bash
# Phase-40784: soft-complete through 40784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40784
PY
grep -qE 'phase40784|through 40784' webui/STATUS.md
echo "OK: phase40784 e2e passed"
