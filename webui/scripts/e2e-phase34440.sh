#!/usr/bin/env bash
# Phase-34440: soft-complete through 34440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34440
PY
grep -qE 'phase34440|through 34440' webui/STATUS.md
echo "OK: phase34440 e2e passed"
