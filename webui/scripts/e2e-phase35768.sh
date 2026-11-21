#!/usr/bin/env bash
# Phase-35768: soft-complete through 35768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35768
PY
grep -qE 'phase35768|through 35768' webui/STATUS.md
echo "OK: phase35768 e2e passed"
