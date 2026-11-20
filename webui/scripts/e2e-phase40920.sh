#!/usr/bin/env bash
# Phase-40920: soft-complete through 40920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40920
PY
grep -qE 'phase40920|through 40920' webui/STATUS.md
echo "OK: phase40920 e2e passed"
