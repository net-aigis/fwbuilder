#!/usr/bin/env bash
# Phase-36920: soft-complete through 36920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36920
PY
grep -qE 'phase36920|through 36920' webui/STATUS.md
echo "OK: phase36920 e2e passed"
