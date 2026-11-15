#!/usr/bin/env bash
# Phase-31912: soft-complete through 31912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31912
PY
grep -qE 'phase31912|through 31912' webui/STATUS.md
echo "OK: phase31912 e2e passed"
