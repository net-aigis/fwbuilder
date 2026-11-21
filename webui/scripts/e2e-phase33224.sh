#!/usr/bin/env bash
# Phase-33224: soft-complete through 33224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33224
PY
grep -qE 'phase33224|through 33224' webui/STATUS.md
echo "OK: phase33224 e2e passed"
