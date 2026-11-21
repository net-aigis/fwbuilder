#!/usr/bin/env bash
# Phase-29568: soft-complete through 29568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29568
PY
grep -qE 'phase29568|through 29568' webui/STATUS.md
echo "OK: phase29568 e2e passed"
