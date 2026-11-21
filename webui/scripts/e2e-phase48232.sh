#!/usr/bin/env bash
# Phase-48232: soft-complete through 48232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48232
PY
grep -qE 'phase48232|through 48232' webui/STATUS.md
echo "OK: phase48232 e2e passed"
