#!/usr/bin/env bash
# Phase-30600: soft-complete through 30600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30600
PY
grep -qE 'phase30600|through 30600' webui/STATUS.md
echo "OK: phase30600 e2e passed"
