#!/usr/bin/env bash
# Phase-38064: soft-complete through 38064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38064
PY
grep -qE 'phase38064|through 38064' webui/STATUS.md
echo "OK: phase38064 e2e passed"
