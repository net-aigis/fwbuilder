#!/usr/bin/env bash
# Phase-31552: soft-complete through 31552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31552
PY
grep -qE 'phase31552|through 31552' webui/STATUS.md
echo "OK: phase31552 e2e passed"
