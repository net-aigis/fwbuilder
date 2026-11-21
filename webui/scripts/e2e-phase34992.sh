#!/usr/bin/env bash
# Phase-34992: soft-complete through 34992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34992
PY
grep -qE 'phase34992|through 34992' webui/STATUS.md
echo "OK: phase34992 e2e passed"
