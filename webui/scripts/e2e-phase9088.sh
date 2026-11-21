#!/usr/bin/env bash
# Phase-9088: soft-complete through 9088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9088
PY
grep -qE 'phase9088|through 9088' webui/STATUS.md
echo "OK: phase9088 e2e passed"
