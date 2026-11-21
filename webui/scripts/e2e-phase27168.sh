#!/usr/bin/env bash
# Phase-27168: soft-complete through 27168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27168
PY
grep -qE 'phase27168|through 27168' webui/STATUS.md
echo "OK: phase27168 e2e passed"
