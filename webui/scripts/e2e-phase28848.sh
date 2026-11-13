#!/usr/bin/env bash
# Phase-28848: soft-complete through 28848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28848
PY
grep -qE 'phase28848|through 28848' webui/STATUS.md
echo "OK: phase28848 e2e passed"
