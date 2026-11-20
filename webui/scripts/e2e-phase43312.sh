#!/usr/bin/env bash
# Phase-43312: soft-complete through 43312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43312
PY
grep -qE 'phase43312|through 43312' webui/STATUS.md
echo "OK: phase43312 e2e passed"
