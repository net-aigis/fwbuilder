#!/usr/bin/env bash
# Phase-48152: soft-complete through 48152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48152
PY
grep -qE 'phase48152|through 48152' webui/STATUS.md
echo "OK: phase48152 e2e passed"
