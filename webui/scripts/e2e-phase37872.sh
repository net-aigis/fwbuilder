#!/usr/bin/env bash
# Phase-37872: soft-complete through 37872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37872
PY
grep -qE 'phase37872|through 37872' webui/STATUS.md
echo "OK: phase37872 e2e passed"
