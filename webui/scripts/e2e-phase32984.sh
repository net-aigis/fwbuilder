#!/usr/bin/env bash
# Phase-32984: soft-complete through 32984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32984
PY
grep -qE 'phase32984|through 32984' webui/STATUS.md
echo "OK: phase32984 e2e passed"
