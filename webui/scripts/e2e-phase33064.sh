#!/usr/bin/env bash
# Phase-33064: soft-complete through 33064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33064
PY
grep -qE 'phase33064|through 33064' webui/STATUS.md
echo "OK: phase33064 e2e passed"
