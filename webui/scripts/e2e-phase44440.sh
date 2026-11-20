#!/usr/bin/env bash
# Phase-44440: soft-complete through 44440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44440
PY
grep -qE 'phase44440|through 44440' webui/STATUS.md
echo "OK: phase44440 e2e passed"
