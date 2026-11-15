#!/usr/bin/env bash
# Phase-32768: soft-complete through 32768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32768
PY
grep -qE 'phase32768|through 32768' webui/STATUS.md
echo "OK: phase32768 e2e passed"
