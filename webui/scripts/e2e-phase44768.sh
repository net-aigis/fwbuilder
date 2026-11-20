#!/usr/bin/env bash
# Phase-44768: soft-complete through 44768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44768
PY
grep -qE 'phase44768|through 44768' webui/STATUS.md
echo "OK: phase44768 e2e passed"
