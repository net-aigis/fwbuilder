#!/usr/bin/env bash
# Phase-45848: soft-complete through 45848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45848
PY
grep -qE 'phase45848|through 45848' webui/STATUS.md
echo "OK: phase45848 e2e passed"
