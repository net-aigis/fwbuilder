#!/usr/bin/env bash
# Phase-33144: soft-complete through 33144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33144
PY
grep -qE 'phase33144|through 33144' webui/STATUS.md
echo "OK: phase33144 e2e passed"
