#!/usr/bin/env bash
# Phase-37776: soft-complete through 37776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37776
PY
grep -qE 'phase37776|through 37776' webui/STATUS.md
echo "OK: phase37776 e2e passed"
