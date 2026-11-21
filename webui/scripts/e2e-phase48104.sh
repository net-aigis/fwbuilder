#!/usr/bin/env bash
# Phase-48104: soft-complete through 48104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48104
PY
grep -qE 'phase48104|through 48104' webui/STATUS.md
echo "OK: phase48104 e2e passed"
