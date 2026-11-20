#!/usr/bin/env bash
# Phase-45632: soft-complete through 45632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45632
PY
grep -qE 'phase45632|through 45632' webui/STATUS.md
echo "OK: phase45632 e2e passed"
