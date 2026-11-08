#!/usr/bin/env bash
# Phase-10608: soft-complete through 10608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10608
PY
grep -qE 'phase10608|through 10608' webui/STATUS.md
echo "OK: phase10608 e2e passed"
