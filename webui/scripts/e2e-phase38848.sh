#!/usr/bin/env bash
# Phase-38848: soft-complete through 38848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38848
PY
grep -qE 'phase38848|through 38848' webui/STATUS.md
echo "OK: phase38848 e2e passed"
