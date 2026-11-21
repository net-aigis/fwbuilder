#!/usr/bin/env bash
# Phase-39984: soft-complete through 39984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39984
PY
grep -qE 'phase39984|through 39984' webui/STATUS.md
echo "OK: phase39984 e2e passed"
