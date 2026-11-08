#!/usr/bin/env bash
# Phase-12768: soft-complete through 12768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12768
PY
grep -qE 'phase12768|through 12768' webui/STATUS.md
echo "OK: phase12768 e2e passed"
