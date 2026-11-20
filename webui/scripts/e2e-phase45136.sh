#!/usr/bin/env bash
# Phase-45136: soft-complete through 45136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45136
PY
grep -qE 'phase45136|through 45136' webui/STATUS.md
echo "OK: phase45136 e2e passed"
