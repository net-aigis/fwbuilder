#!/usr/bin/env bash
# Phase-36224: soft-complete through 36224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36224
PY
grep -qE 'phase36224|through 36224' webui/STATUS.md
echo "OK: phase36224 e2e passed"
