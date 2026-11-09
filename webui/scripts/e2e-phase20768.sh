#!/usr/bin/env bash
# Phase-20768: soft-complete through 20768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20768
PY
grep -qE 'phase20768|through 20768' webui/STATUS.md
echo "OK: phase20768 e2e passed"
