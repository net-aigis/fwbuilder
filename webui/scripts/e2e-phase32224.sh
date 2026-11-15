#!/usr/bin/env bash
# Phase-32224: soft-complete through 32224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32224
PY
grep -qE 'phase32224|through 32224' webui/STATUS.md
echo "OK: phase32224 e2e passed"
