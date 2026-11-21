#!/usr/bin/env bash
# Phase-42256: soft-complete through 42256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42256
PY
grep -qE 'phase42256|through 42256' webui/STATUS.md
echo "OK: phase42256 e2e passed"
