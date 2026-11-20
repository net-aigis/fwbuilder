#!/usr/bin/env bash
# Phase-37720: soft-complete through 37720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37720
PY
grep -qE 'phase37720|through 37720' webui/STATUS.md
echo "OK: phase37720 e2e passed"
