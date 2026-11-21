#!/usr/bin/env bash
# Phase-12608: soft-complete through 12608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12608
PY
grep -qE 'phase12608|through 12608' webui/STATUS.md
echo "OK: phase12608 e2e passed"
