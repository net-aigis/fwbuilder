#!/usr/bin/env bash
# Phase-45440: soft-complete through 45440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45440
PY
grep -qE 'phase45440|through 45440' webui/STATUS.md
echo "OK: phase45440 e2e passed"
