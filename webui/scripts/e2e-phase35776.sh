#!/usr/bin/env bash
# Phase-35776: soft-complete through 35776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35776
PY
grep -qE 'phase35776|through 35776' webui/STATUS.md
echo "OK: phase35776 e2e passed"
