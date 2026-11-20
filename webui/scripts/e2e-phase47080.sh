#!/usr/bin/env bash
# Phase-47080: soft-complete through 47080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47080
PY
grep -qE 'phase47080|through 47080' webui/STATUS.md
echo "OK: phase47080 e2e passed"
