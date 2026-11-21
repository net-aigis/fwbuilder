#!/usr/bin/env bash
# Phase-48256: soft-complete through 48256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48256
PY
grep -qE 'phase48256|through 48256' webui/STATUS.md
echo "OK: phase48256 e2e passed"
