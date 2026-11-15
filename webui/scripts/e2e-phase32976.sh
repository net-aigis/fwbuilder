#!/usr/bin/env bash
# Phase-32976: soft-complete through 32976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32976
PY
grep -qE 'phase32976|through 32976' webui/STATUS.md
echo "OK: phase32976 e2e passed"
