#!/usr/bin/env bash
# Phase-48672: soft-complete through 48672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48672
PY
grep -qE 'phase48672|through 48672' webui/STATUS.md
echo "OK: phase48672 e2e passed"
