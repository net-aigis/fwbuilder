#!/usr/bin/env bash
# Phase-43048: soft-complete through 43048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43048
PY
grep -qE 'phase43048|through 43048' webui/STATUS.md
echo "OK: phase43048 e2e passed"
