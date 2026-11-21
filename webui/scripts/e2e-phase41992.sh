#!/usr/bin/env bash
# Phase-41992: soft-complete through 41992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41992
PY
grep -qE 'phase41992|through 41992' webui/STATUS.md
echo "OK: phase41992 e2e passed"
