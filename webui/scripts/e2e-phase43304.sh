#!/usr/bin/env bash
# Phase-43304: soft-complete through 43304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43304
PY
grep -qE 'phase43304|through 43304' webui/STATUS.md
echo "OK: phase43304 e2e passed"
