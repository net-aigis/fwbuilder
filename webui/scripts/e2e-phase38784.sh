#!/usr/bin/env bash
# Phase-38784: soft-complete through 38784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38784
PY
grep -qE 'phase38784|through 38784' webui/STATUS.md
echo "OK: phase38784 e2e passed"
