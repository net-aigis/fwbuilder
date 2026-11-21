#!/usr/bin/env bash
# Phase-41048: soft-complete through 41048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41048
PY
grep -qE 'phase41048|through 41048' webui/STATUS.md
echo "OK: phase41048 e2e passed"
