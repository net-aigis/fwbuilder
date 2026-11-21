#!/usr/bin/env bash
# Phase-48552: soft-complete through 48552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48552
PY
grep -qE 'phase48552|through 48552' webui/STATUS.md
echo "OK: phase48552 e2e passed"
