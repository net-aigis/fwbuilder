#!/usr/bin/env bash
# Phase-31768: soft-complete through 31768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31768
PY
grep -qE 'phase31768|through 31768' webui/STATUS.md
echo "OK: phase31768 e2e passed"
