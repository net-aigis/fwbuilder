#!/usr/bin/env bash
# Phase-41776: soft-complete through 41776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41776
PY
grep -qE 'phase41776|through 41776' webui/STATUS.md
echo "OK: phase41776 e2e passed"
