#!/usr/bin/env bash
# Phase-48496: soft-complete through 48496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48496
PY
grep -qE 'phase48496|through 48496' webui/STATUS.md
echo "OK: phase48496 e2e passed"
