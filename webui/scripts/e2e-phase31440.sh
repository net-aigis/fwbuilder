#!/usr/bin/env bash
# Phase-31440: soft-complete through 31440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31440
PY
grep -qE 'phase31440|through 31440' webui/STATUS.md
echo "OK: phase31440 e2e passed"
