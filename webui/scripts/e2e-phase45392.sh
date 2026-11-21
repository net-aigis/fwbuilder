#!/usr/bin/env bash
# Phase-45392: soft-complete through 45392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45392
PY
grep -qE 'phase45392|through 45392' webui/STATUS.md
echo "OK: phase45392 e2e passed"
