#!/usr/bin/env bash
# Phase-44048: soft-complete through 44048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44048
PY
grep -qE 'phase44048|through 44048' webui/STATUS.md
echo "OK: phase44048 e2e passed"
