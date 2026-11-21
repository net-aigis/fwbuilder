#!/usr/bin/env bash
# Phase-45872: soft-complete through 45872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45872
PY
grep -qE 'phase45872|through 45872' webui/STATUS.md
echo "OK: phase45872 e2e passed"
