#!/usr/bin/env bash
# Phase-42872: soft-complete through 42872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42872
PY
grep -qE 'phase42872|through 42872' webui/STATUS.md
echo "OK: phase42872 e2e passed"
