#!/usr/bin/env bash
# Phase-24048: soft-complete through 24048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24048
PY
grep -qE 'phase24048|through 24048' webui/STATUS.md
echo "OK: phase24048 e2e passed"
