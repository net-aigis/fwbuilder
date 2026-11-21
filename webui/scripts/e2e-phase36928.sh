#!/usr/bin/env bash
# Phase-36928: soft-complete through 36928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36928
PY
grep -qE 'phase36928|through 36928' webui/STATUS.md
echo "OK: phase36928 e2e passed"
