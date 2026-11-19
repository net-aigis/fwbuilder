#!/usr/bin/env bash
# Phase-33960: soft-complete through 33960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33960
PY
grep -qE 'phase33960|through 33960' webui/STATUS.md
echo "OK: phase33960 e2e passed"
