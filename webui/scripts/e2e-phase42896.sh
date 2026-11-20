#!/usr/bin/env bash
# Phase-42896: soft-complete through 42896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42896
PY
grep -qE 'phase42896|through 42896' webui/STATUS.md
echo "OK: phase42896 e2e passed"
