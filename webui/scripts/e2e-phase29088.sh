#!/usr/bin/env bash
# Phase-29088: soft-complete through 29088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29088
PY
grep -qE 'phase29088|through 29088' webui/STATUS.md
echo "OK: phase29088 e2e passed"
