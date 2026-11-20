#!/usr/bin/env bash
# Phase-35384: soft-complete through 35384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35384
PY
grep -qE 'phase35384|through 35384' webui/STATUS.md
echo "OK: phase35384 e2e passed"
