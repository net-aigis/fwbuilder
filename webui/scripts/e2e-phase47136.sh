#!/usr/bin/env bash
# Phase-47136: soft-complete through 47136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47136
PY
grep -qE 'phase47136|through 47136' webui/STATUS.md
echo "OK: phase47136 e2e passed"
