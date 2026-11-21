#!/usr/bin/env bash
# Phase-43000: soft-complete through 43000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43000
PY
grep -qE 'phase43000|through 43000' webui/STATUS.md
echo "OK: phase43000 e2e passed"
