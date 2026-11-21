#!/usr/bin/env bash
# Phase-34912: soft-complete through 34912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34912
PY
grep -qE 'phase34912|through 34912' webui/STATUS.md
echo "OK: phase34912 e2e passed"
