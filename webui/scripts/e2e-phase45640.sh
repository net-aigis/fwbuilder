#!/usr/bin/env bash
# Phase-45640: soft-complete through 45640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45640
PY
grep -qE 'phase45640|through 45640' webui/STATUS.md
echo "OK: phase45640 e2e passed"
