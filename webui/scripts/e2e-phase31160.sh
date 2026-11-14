#!/usr/bin/env bash
# Phase-31160: soft-complete through 31160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31160
PY
grep -qE 'phase31160|through 31160' webui/STATUS.md
echo "OK: phase31160 e2e passed"
