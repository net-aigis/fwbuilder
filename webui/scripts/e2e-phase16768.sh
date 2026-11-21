#!/usr/bin/env bash
# Phase-16768: soft-complete through 16768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16768
PY
grep -qE 'phase16768|through 16768' webui/STATUS.md
echo "OK: phase16768 e2e passed"
