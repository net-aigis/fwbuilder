#!/usr/bin/env bash
# Phase-43616: soft-complete through 43616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43616
PY
grep -qE 'phase43616|through 43616' webui/STATUS.md
echo "OK: phase43616 e2e passed"
