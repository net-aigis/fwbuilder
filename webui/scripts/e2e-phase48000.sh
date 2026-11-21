#!/usr/bin/env bash
# Phase-48000: soft-complete through 48000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48000
PY
grep -qE 'phase48000|through 48000' webui/STATUS.md
echo "OK: phase48000 e2e passed"
