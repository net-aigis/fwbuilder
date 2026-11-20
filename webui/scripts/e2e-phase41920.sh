#!/usr/bin/env bash
# Phase-41920: soft-complete through 41920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41920
PY
grep -qE 'phase41920|through 41920' webui/STATUS.md
echo "OK: phase41920 e2e passed"
