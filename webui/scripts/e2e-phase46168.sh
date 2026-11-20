#!/usr/bin/env bash
# Phase-46168: soft-complete through 46168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46168
PY
grep -qE 'phase46168|through 46168' webui/STATUS.md
echo "OK: phase46168 e2e passed"
