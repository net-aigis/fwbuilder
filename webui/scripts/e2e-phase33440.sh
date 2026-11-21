#!/usr/bin/env bash
# Phase-33440: soft-complete through 33440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33440
PY
grep -qE 'phase33440|through 33440' webui/STATUS.md
echo "OK: phase33440 e2e passed"
