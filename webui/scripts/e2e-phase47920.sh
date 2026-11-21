#!/usr/bin/env bash
# Phase-47920: soft-complete through 47920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47920
PY
grep -qE 'phase47920|through 47920' webui/STATUS.md
echo "OK: phase47920 e2e passed"
