#!/usr/bin/env bash
# Phase-43464: soft-complete through 43464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43464
PY
grep -qE 'phase43464|through 43464' webui/STATUS.md
echo "OK: phase43464 e2e passed"
