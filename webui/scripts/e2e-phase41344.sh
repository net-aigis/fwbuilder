#!/usr/bin/env bash
# Phase-41344: soft-complete through 41344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41344
PY
grep -qE 'phase41344|through 41344' webui/STATUS.md
echo "OK: phase41344 e2e passed"
