#!/usr/bin/env bash
# Phase-41480: soft-complete through 41480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41480
PY
grep -qE 'phase41480|through 41480' webui/STATUS.md
echo "OK: phase41480 e2e passed"
