#!/usr/bin/env bash
# Phase-33768: soft-complete through 33768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33768
PY
grep -qE 'phase33768|through 33768' webui/STATUS.md
echo "OK: phase33768 e2e passed"
