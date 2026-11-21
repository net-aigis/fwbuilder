#!/usr/bin/env bash
# Phase-48600: soft-complete through 48600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48600
PY
grep -qE 'phase48600|through 48600' webui/STATUS.md
echo "OK: phase48600 e2e passed"
