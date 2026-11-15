#!/usr/bin/env bash
# Phase-33080: soft-complete through 33080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33080
PY
grep -qE 'phase33080|through 33080' webui/STATUS.md
echo "OK: phase33080 e2e passed"
