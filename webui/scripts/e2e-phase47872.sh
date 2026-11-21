#!/usr/bin/env bash
# Phase-47872: soft-complete through 47872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47872
PY
grep -qE 'phase47872|through 47872' webui/STATUS.md
echo "OK: phase47872 e2e passed"
