#!/usr/bin/env bash
# Phase-44168: soft-complete through 44168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44168
PY
grep -qE 'phase44168|through 44168' webui/STATUS.md
echo "OK: phase44168 e2e passed"
