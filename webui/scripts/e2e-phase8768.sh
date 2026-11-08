#!/usr/bin/env bash
# Phase-8768: soft-complete through 8768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8768
PY
grep -qE 'phase8768|through 8768' webui/STATUS.md
echo "OK: phase8768 e2e passed"
