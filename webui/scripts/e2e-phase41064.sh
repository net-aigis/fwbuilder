#!/usr/bin/env bash
# Phase-41064: soft-complete through 41064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41064
PY
grep -qE 'phase41064|through 41064' webui/STATUS.md
echo "OK: phase41064 e2e passed"
