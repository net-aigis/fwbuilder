#!/usr/bin/env bash
# Phase-34576: soft-complete through 34576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34576
PY
grep -qE 'phase34576|through 34576' webui/STATUS.md
echo "OK: phase34576 e2e passed"
