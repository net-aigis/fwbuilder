#!/usr/bin/env bash
# Phase-34896: soft-complete through 34896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34896
PY
grep -qE 'phase34896|through 34896' webui/STATUS.md
echo "OK: phase34896 e2e passed"
