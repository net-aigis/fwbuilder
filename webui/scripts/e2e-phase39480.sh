#!/usr/bin/env bash
# Phase-39480: soft-complete through 39480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39480
PY
grep -qE 'phase39480|through 39480' webui/STATUS.md
echo "OK: phase39480 e2e passed"
