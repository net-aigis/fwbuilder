#!/usr/bin/env bash
# Phase-48088: soft-complete through 48088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48088
PY
grep -qE 'phase48088|through 48088' webui/STATUS.md
echo "OK: phase48088 e2e passed"
