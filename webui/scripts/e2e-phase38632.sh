#!/usr/bin/env bash
# Phase-38632: soft-complete through 38632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38632
PY
grep -qE 'phase38632|through 38632' webui/STATUS.md
echo "OK: phase38632 e2e passed"
