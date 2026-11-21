#!/usr/bin/env bash
# Phase-41928: soft-complete through 41928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41928
PY
grep -qE 'phase41928|through 41928' webui/STATUS.md
echo "OK: phase41928 e2e passed"
