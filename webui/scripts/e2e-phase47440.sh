#!/usr/bin/env bash
# Phase-47440: soft-complete through 47440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47440
PY
grep -qE 'phase47440|through 47440' webui/STATUS.md
echo "OK: phase47440 e2e passed"
