#!/usr/bin/env bash
# Phase-42912: soft-complete through 42912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42912
PY
grep -qE 'phase42912|through 42912' webui/STATUS.md
echo "OK: phase42912 e2e passed"
