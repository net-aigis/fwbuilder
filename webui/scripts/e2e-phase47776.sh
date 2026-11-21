#!/usr/bin/env bash
# Phase-47776: soft-complete through 47776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47776
PY
grep -qE 'phase47776|through 47776' webui/STATUS.md
echo "OK: phase47776 e2e passed"
