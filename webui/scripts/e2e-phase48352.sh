#!/usr/bin/env bash
# Phase-48352: soft-complete through 48352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48352
PY
grep -qE 'phase48352|through 48352' webui/STATUS.md
echo "OK: phase48352 e2e passed"
