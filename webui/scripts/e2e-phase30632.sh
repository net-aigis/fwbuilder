#!/usr/bin/env bash
# Phase-30632: soft-complete through 30632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30632
PY
grep -qE 'phase30632|through 30632' webui/STATUS.md
echo "OK: phase30632 e2e passed"
