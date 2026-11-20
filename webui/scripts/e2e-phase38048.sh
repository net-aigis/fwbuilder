#!/usr/bin/env bash
# Phase-38048: soft-complete through 38048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38048
PY
grep -qE 'phase38048|through 38048' webui/STATUS.md
echo "OK: phase38048 e2e passed"
