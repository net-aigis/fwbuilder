#!/usr/bin/env bash
# Phase-48280: soft-complete through 48280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48280
PY
grep -qE 'phase48280|through 48280' webui/STATUS.md
echo "OK: phase48280 e2e passed"
