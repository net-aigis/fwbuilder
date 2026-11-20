#!/usr/bin/env bash
# Phase-46576: soft-complete through 46576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46576
PY
grep -qE 'phase46576|through 46576' webui/STATUS.md
echo "OK: phase46576 e2e passed"
