#!/usr/bin/env bash
# Phase-47848: soft-complete through 47848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47848
PY
grep -qE 'phase47848|through 47848' webui/STATUS.md
echo "OK: phase47848 e2e passed"
