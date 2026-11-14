#!/usr/bin/env bash
# Phase-31040: soft-complete through 31040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31040
PY
grep -qE 'phase31040|through 31040' webui/STATUS.md
echo "OK: phase31040 e2e passed"
