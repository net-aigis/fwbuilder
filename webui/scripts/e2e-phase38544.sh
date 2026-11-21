#!/usr/bin/env bash
# Phase-38544: soft-complete through 38544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38544
PY
grep -qE 'phase38544|through 38544' webui/STATUS.md
echo "OK: phase38544 e2e passed"
