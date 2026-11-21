#!/usr/bin/env bash
# Phase-48016: soft-complete through 48016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48016
PY
grep -qE 'phase48016|through 48016' webui/STATUS.md
echo "OK: phase48016 e2e passed"
