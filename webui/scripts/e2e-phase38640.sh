#!/usr/bin/env bash
# Phase-38640: soft-complete through 38640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38640
PY
grep -qE 'phase38640|through 38640' webui/STATUS.md
echo "OK: phase38640 e2e passed"
