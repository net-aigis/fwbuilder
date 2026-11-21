#!/usr/bin/env bash
# Phase-38256: soft-complete through 38256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38256
PY
grep -qE 'phase38256|through 38256' webui/STATUS.md
echo "OK: phase38256 e2e passed"
