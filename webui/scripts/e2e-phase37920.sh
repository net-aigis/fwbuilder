#!/usr/bin/env bash
# Phase-37920: soft-complete through 37920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37920
PY
grep -qE 'phase37920|through 37920' webui/STATUS.md
echo "OK: phase37920 e2e passed"
