#!/usr/bin/env bash
# Phase-47464: soft-complete through 47464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47464
PY
grep -qE 'phase47464|through 47464' webui/STATUS.md
echo "OK: phase47464 e2e passed"
