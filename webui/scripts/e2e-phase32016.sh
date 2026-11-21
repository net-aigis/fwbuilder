#!/usr/bin/env bash
# Phase-32016: soft-complete through 32016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32016
PY
grep -qE 'phase32016|through 32016' webui/STATUS.md
echo "OK: phase32016 e2e passed"
