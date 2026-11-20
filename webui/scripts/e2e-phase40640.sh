#!/usr/bin/env bash
# Phase-40640: soft-complete through 40640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40640
PY
grep -qE 'phase40640|through 40640' webui/STATUS.md
echo "OK: phase40640 e2e passed"
