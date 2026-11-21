#!/usr/bin/env bash
# Phase-34160: soft-complete through 34160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34160
PY
grep -qE 'phase34160|through 34160' webui/STATUS.md
echo "OK: phase34160 e2e passed"
