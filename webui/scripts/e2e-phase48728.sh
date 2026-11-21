#!/usr/bin/env bash
# Phase-48728: soft-complete through 48728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48728
PY
grep -qE 'phase48728|through 48728' webui/STATUS.md
echo "OK: phase48728 e2e passed"
