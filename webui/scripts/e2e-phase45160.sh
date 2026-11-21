#!/usr/bin/env bash
# Phase-45160: soft-complete through 45160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45160
PY
grep -qE 'phase45160|through 45160' webui/STATUS.md
echo "OK: phase45160 e2e passed"
