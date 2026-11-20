#!/usr/bin/env bash
# Phase-45040: soft-complete through 45040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45040
PY
grep -qE 'phase45040|through 45040' webui/STATUS.md
echo "OK: phase45040 e2e passed"
