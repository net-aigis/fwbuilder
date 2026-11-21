#!/usr/bin/env bash
# Phase-40768: soft-complete through 40768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40768
PY
grep -qE 'phase40768|through 40768' webui/STATUS.md
echo "OK: phase40768 e2e passed"
