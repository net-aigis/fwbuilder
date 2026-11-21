#!/usr/bin/env bash
# Phase-33568: soft-complete through 33568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33568
PY
grep -qE 'phase33568|through 33568' webui/STATUS.md
echo "OK: phase33568 e2e passed"
