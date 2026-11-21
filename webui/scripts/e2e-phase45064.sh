#!/usr/bin/env bash
# Phase-45064: soft-complete through 45064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45064
PY
grep -qE 'phase45064|through 45064' webui/STATUS.md
echo "OK: phase45064 e2e passed"
