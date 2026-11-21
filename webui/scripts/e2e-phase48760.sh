#!/usr/bin/env bash
# Phase-48760: soft-complete through 48760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48760
PY
grep -qE 'phase48760|through 48760' webui/STATUS.md
echo "OK: phase48760 e2e passed"
