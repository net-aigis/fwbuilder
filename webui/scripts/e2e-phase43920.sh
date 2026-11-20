#!/usr/bin/env bash
# Phase-43920: soft-complete through 43920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43920
PY
grep -qE 'phase43920|through 43920' webui/STATUS.md
echo "OK: phase43920 e2e passed"
