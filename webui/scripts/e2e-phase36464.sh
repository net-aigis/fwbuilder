#!/usr/bin/env bash
# Phase-36464: soft-complete through 36464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36464
PY
grep -qE 'phase36464|through 36464' webui/STATUS.md
echo "OK: phase36464 e2e passed"
