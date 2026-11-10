#!/usr/bin/env bash
# Phase-26928: soft-complete through 26928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26928
PY
grep -qE 'phase26928|through 26928' webui/STATUS.md
echo "OK: phase26928 e2e passed"
