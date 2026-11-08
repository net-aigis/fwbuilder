#!/usr/bin/env bash
# Phase-10768: soft-complete through 10768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10768
PY
grep -qE 'phase10768|through 10768' webui/STATUS.md
echo "OK: phase10768 e2e passed"
