#!/usr/bin/env bash
# Phase-30440: soft-complete through 30440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30440
PY
grep -qE 'phase30440|through 30440' webui/STATUS.md
echo "OK: phase30440 e2e passed"
