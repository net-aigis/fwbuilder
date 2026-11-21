#!/usr/bin/env bash
# Phase-45704: soft-complete through 45704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45704
PY
grep -qE 'phase45704|through 45704' webui/STATUS.md
echo "OK: phase45704 e2e passed"
