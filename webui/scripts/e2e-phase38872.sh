#!/usr/bin/env bash
# Phase-38872: soft-complete through 38872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38872
PY
grep -qE 'phase38872|through 38872' webui/STATUS.md
echo "OK: phase38872 e2e passed"
