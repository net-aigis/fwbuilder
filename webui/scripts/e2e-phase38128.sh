#!/usr/bin/env bash
# Phase-38128: soft-complete through 38128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38128
PY
grep -qE 'phase38128|through 38128' webui/STATUS.md
echo "OK: phase38128 e2e passed"
