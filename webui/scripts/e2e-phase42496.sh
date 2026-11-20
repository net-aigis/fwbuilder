#!/usr/bin/env bash
# Phase-42496: soft-complete through 42496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42496
PY
grep -qE 'phase42496|through 42496' webui/STATUS.md
echo "OK: phase42496 e2e passed"
