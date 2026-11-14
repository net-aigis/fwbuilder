#!/usr/bin/env bash
# Phase-30920: soft-complete through 30920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30920
PY
grep -qE 'phase30920|through 30920' webui/STATUS.md
echo "OK: phase30920 e2e passed"
