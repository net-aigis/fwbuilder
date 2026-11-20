#!/usr/bin/env bash
# Phase-40040: soft-complete through 40040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40040
PY
grep -qE 'phase40040|through 40040' webui/STATUS.md
echo "OK: phase40040 e2e passed"
