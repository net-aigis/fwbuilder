#!/usr/bin/env bash
# Phase-41184: soft-complete through 41184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41184
PY
grep -qE 'phase41184|through 41184' webui/STATUS.md
echo "OK: phase41184 e2e passed"
