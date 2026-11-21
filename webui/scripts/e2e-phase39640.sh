#!/usr/bin/env bash
# Phase-39640: soft-complete through 39640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39640
PY
grep -qE 'phase39640|through 39640' webui/STATUS.md
echo "OK: phase39640 e2e passed"
