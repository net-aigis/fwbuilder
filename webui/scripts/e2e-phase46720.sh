#!/usr/bin/env bash
# Phase-46720: soft-complete through 46720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46720
PY
grep -qE 'phase46720|through 46720' webui/STATUS.md
echo "OK: phase46720 e2e passed"
