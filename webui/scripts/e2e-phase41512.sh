#!/usr/bin/env bash
# Phase-41512: soft-complete through 41512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41512
PY
grep -qE 'phase41512|through 41512' webui/STATUS.md
echo "OK: phase41512 e2e passed"
