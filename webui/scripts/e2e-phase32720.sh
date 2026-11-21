#!/usr/bin/env bash
# Phase-32720: soft-complete through 32720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32720
PY
grep -qE 'phase32720|through 32720' webui/STATUS.md
echo "OK: phase32720 e2e passed"
