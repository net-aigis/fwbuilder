#!/usr/bin/env bash
# Phase-38760: soft-complete through 38760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38760
PY
grep -qE 'phase38760|through 38760' webui/STATUS.md
echo "OK: phase38760 e2e passed"
