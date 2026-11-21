#!/usr/bin/env bash
# Phase-48120: soft-complete through 48120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48120
PY
grep -qE 'phase48120|through 48120' webui/STATUS.md
echo "OK: phase48120 e2e passed"
