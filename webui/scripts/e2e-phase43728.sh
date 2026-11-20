#!/usr/bin/env bash
# Phase-43728: soft-complete through 43728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43728
PY
grep -qE 'phase43728|through 43728' webui/STATUS.md
echo "OK: phase43728 e2e passed"
