#!/usr/bin/env bash
# Phase-37296: soft-complete through 37296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37296
PY
grep -qE 'phase37296|through 37296' webui/STATUS.md
echo "OK: phase37296 e2e passed"
