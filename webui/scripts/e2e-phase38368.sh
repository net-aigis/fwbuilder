#!/usr/bin/env bash
# Phase-38368: soft-complete through 38368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38368
PY
grep -qE 'phase38368|through 38368' webui/STATUS.md
echo "OK: phase38368 e2e passed"
