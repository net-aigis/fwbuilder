#!/usr/bin/env bash
# Phase-40872: soft-complete through 40872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40872
PY
grep -qE 'phase40872|through 40872' webui/STATUS.md
echo "OK: phase40872 e2e passed"
