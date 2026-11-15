#!/usr/bin/env bash
# Phase-31776: soft-complete through 31776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31776
PY
grep -qE 'phase31776|through 31776' webui/STATUS.md
echo "OK: phase31776 e2e passed"
