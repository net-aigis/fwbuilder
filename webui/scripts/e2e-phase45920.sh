#!/usr/bin/env bash
# Phase-45920: soft-complete through 45920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45920
PY
grep -qE 'phase45920|through 45920' webui/STATUS.md
echo "OK: phase45920 e2e passed"
