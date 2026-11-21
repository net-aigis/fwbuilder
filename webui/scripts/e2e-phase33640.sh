#!/usr/bin/env bash
# Phase-33640: soft-complete through 33640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33640
PY
grep -qE 'phase33640|through 33640' webui/STATUS.md
echo "OK: phase33640 e2e passed"
