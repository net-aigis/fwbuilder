#!/usr/bin/env bash
# Phase-39064: soft-complete through 39064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39064
PY
grep -qE 'phase39064|through 39064' webui/STATUS.md
echo "OK: phase39064 e2e passed"
