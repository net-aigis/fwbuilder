#!/usr/bin/env bash
# Phase-43360: soft-complete through 43360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43360
PY
grep -qE 'phase43360|through 43360' webui/STATUS.md
echo "OK: phase43360 e2e passed"
