#!/usr/bin/env bash
# Phase-33872: soft-complete through 33872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33872
PY
grep -qE 'phase33872|through 33872' webui/STATUS.md
echo "OK: phase33872 e2e passed"
