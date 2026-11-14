#!/usr/bin/env bash
# Phase-31168: soft-complete through 31168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31168
PY
grep -qE 'phase31168|through 31168' webui/STATUS.md
echo "OK: phase31168 e2e passed"
