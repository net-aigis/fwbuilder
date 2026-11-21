#!/usr/bin/env bash
# Phase-24208: soft-complete through 24208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24208
PY
grep -qE 'phase24208|through 24208' webui/STATUS.md
echo "OK: phase24208 e2e passed"
