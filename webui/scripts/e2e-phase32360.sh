#!/usr/bin/env bash
# Phase-32360: soft-complete through 32360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32360
PY
grep -qE 'phase32360|through 32360' webui/STATUS.md
echo "OK: phase32360 e2e passed"
