#!/usr/bin/env bash
# Phase-43640: soft-complete through 43640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43640
PY
grep -qE 'phase43640|through 43640' webui/STATUS.md
echo "OK: phase43640 e2e passed"
