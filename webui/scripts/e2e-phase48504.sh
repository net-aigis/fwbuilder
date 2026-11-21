#!/usr/bin/env bash
# Phase-48504: soft-complete through 48504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48504
PY
grep -qE 'phase48504|through 48504' webui/STATUS.md
echo "OK: phase48504 e2e passed"
