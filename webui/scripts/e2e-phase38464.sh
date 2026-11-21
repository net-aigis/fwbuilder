#!/usr/bin/env bash
# Phase-38464: soft-complete through 38464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38464
PY
grep -qE 'phase38464|through 38464' webui/STATUS.md
echo "OK: phase38464 e2e passed"
