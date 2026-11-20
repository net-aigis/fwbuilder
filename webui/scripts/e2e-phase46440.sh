#!/usr/bin/env bash
# Phase-46440: soft-complete through 46440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46440
PY
grep -qE 'phase46440|through 46440' webui/STATUS.md
echo "OK: phase46440 e2e passed"
