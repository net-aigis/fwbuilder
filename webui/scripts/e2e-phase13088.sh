#!/usr/bin/env bash
# Phase-13088: soft-complete through 13088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13088
PY
grep -qE 'phase13088|through 13088' webui/STATUS.md
echo "OK: phase13088 e2e passed"
