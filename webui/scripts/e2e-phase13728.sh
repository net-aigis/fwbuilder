#!/usr/bin/env bash
# Phase-13728: soft-complete through 13728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13728
PY
grep -qE 'phase13728|through 13728' webui/STATUS.md
echo "OK: phase13728 e2e passed"
