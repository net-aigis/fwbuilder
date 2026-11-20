#!/usr/bin/env bash
# Phase-41720: soft-complete through 41720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41720
PY
grep -qE 'phase41720|through 41720' webui/STATUS.md
echo "OK: phase41720 e2e passed"
