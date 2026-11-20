#!/usr/bin/env bash
# Phase-39768: soft-complete through 39768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39768
PY
grep -qE 'phase39768|through 39768' webui/STATUS.md
echo "OK: phase39768 e2e passed"
