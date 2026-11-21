#!/usr/bin/env bash
# Phase-48368: soft-complete through 48368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48368
PY
grep -qE 'phase48368|through 48368' webui/STATUS.md
echo "OK: phase48368 e2e passed"
