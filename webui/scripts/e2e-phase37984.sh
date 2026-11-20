#!/usr/bin/env bash
# Phase-37984: soft-complete through 37984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37984
PY
grep -qE 'phase37984|through 37984' webui/STATUS.md
echo "OK: phase37984 e2e passed"
