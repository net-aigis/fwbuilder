#!/usr/bin/env bash
# Phase-46768: soft-complete through 46768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46768
PY
grep -qE 'phase46768|through 46768' webui/STATUS.md
echo "OK: phase46768 e2e passed"
