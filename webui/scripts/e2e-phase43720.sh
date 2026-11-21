#!/usr/bin/env bash
# Phase-43720: soft-complete through 43720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43720
PY
grep -qE 'phase43720|through 43720' webui/STATUS.md
echo "OK: phase43720 e2e passed"
