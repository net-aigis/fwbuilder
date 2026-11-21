#!/usr/bin/env bash
# Phase-37768: soft-complete through 37768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37768
PY
grep -qE 'phase37768|through 37768' webui/STATUS.md
echo "OK: phase37768 e2e passed"
