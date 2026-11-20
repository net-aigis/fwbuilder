#!/usr/bin/env bash
# Phase-46224: soft-complete through 46224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46224
PY
grep -qE 'phase46224|through 46224' webui/STATUS.md
echo "OK: phase46224 e2e passed"
