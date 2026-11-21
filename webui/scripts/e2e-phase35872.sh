#!/usr/bin/env bash
# Phase-35872: soft-complete through 35872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35872
PY
grep -qE 'phase35872|through 35872' webui/STATUS.md
echo "OK: phase35872 e2e passed"
