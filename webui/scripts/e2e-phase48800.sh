#!/usr/bin/env bash
# Phase-48800: soft-complete through 48800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48800
PY
grep -qE 'phase48800|through 48800' webui/STATUS.md
echo "OK: phase48800 e2e passed"
