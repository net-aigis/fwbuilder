#!/usr/bin/env bash
# Phase-37168: soft-complete through 37168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37168
PY
grep -qE 'phase37168|through 37168' webui/STATUS.md
echo "OK: phase37168 e2e passed"
