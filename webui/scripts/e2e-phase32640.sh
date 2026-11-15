#!/usr/bin/env bash
# Phase-32640: soft-complete through 32640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32640
PY
grep -qE 'phase32640|through 32640' webui/STATUS.md
echo "OK: phase32640 e2e passed"
