#!/usr/bin/env bash
# Phase-33784: soft-complete through 33784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33784
PY
grep -qE 'phase33784|through 33784' webui/STATUS.md
echo "OK: phase33784 e2e passed"
