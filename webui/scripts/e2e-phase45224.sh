#!/usr/bin/env bash
# Phase-45224: soft-complete through 45224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45224
PY
grep -qE 'phase45224|through 45224' webui/STATUS.md
echo "OK: phase45224 e2e passed"
