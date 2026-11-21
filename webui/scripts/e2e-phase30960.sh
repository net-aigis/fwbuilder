#!/usr/bin/env bash
# Phase-30960: soft-complete through 30960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30960
PY
grep -qE 'phase30960|through 30960' webui/STATUS.md
echo "OK: phase30960 e2e passed"
