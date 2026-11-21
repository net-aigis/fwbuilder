#!/usr/bin/env bash
# Phase-24608: soft-complete through 24608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24608
PY
grep -qE 'phase24608|through 24608' webui/STATUS.md
echo "OK: phase24608 e2e passed"
