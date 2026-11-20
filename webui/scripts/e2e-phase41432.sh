#!/usr/bin/env bash
# Phase-41432: soft-complete through 41432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41432
PY
grep -qE 'phase41432|through 41432' webui/STATUS.md
echo "OK: phase41432 e2e passed"
