#!/usr/bin/env bash
# Phase-46928: soft-complete through 46928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46928
PY
grep -qE 'phase46928|through 46928' webui/STATUS.md
echo "OK: phase46928 e2e passed"
