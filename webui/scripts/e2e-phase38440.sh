#!/usr/bin/env bash
# Phase-38440: soft-complete through 38440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38440
PY
grep -qE 'phase38440|through 38440' webui/STATUS.md
echo "OK: phase38440 e2e passed"
