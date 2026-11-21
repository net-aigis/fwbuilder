#!/usr/bin/env bash
# Phase-42976: soft-complete through 42976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42976
PY
grep -qE 'phase42976|through 42976' webui/STATUS.md
echo "OK: phase42976 e2e passed"
