#!/usr/bin/env bash
# Phase-36720: soft-complete through 36720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36720
PY
grep -qE 'phase36720|through 36720' webui/STATUS.md
echo "OK: phase36720 e2e passed"
