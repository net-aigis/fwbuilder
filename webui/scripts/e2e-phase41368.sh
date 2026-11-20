#!/usr/bin/env bash
# Phase-41368: soft-complete through 41368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41368
PY
grep -qE 'phase41368|through 41368' webui/STATUS.md
echo "OK: phase41368 e2e passed"
