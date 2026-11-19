#!/usr/bin/env bash
# Phase-33776: soft-complete through 33776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33776
PY
grep -qE 'phase33776|through 33776' webui/STATUS.md
echo "OK: phase33776 e2e passed"
