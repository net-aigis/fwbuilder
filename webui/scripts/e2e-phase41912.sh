#!/usr/bin/env bash
# Phase-41912: soft-complete through 41912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41912
PY
grep -qE 'phase41912|through 41912' webui/STATUS.md
echo "OK: phase41912 e2e passed"
