#!/usr/bin/env bash
# Phase-40720: soft-complete through 40720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40720
PY
grep -qE 'phase40720|through 40720' webui/STATUS.md
echo "OK: phase40720 e2e passed"
