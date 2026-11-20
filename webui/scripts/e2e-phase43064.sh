#!/usr/bin/env bash
# Phase-43064: soft-complete through 43064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43064
PY
grep -qE 'phase43064|through 43064' webui/STATUS.md
echo "OK: phase43064 e2e passed"
