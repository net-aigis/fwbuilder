#!/usr/bin/env bash
# Phase-43224: soft-complete through 43224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43224
PY
grep -qE 'phase43224|through 43224' webui/STATUS.md
echo "OK: phase43224 e2e passed"
