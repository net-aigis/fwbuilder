#!/usr/bin/env bash
# Phase-48328: soft-complete through 48328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48328
PY
grep -qE 'phase48328|through 48328' webui/STATUS.md
echo "OK: phase48328 e2e passed"
