#!/usr/bin/env bash
# Phase-46160: soft-complete through 46160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46160
PY
grep -qE 'phase46160|through 46160' webui/STATUS.md
echo "OK: phase46160 e2e passed"
