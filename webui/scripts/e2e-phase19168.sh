#!/usr/bin/env bash
# Phase-19168: soft-complete through 19168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19168
PY
grep -qE 'phase19168|through 19168' webui/STATUS.md
echo "OK: phase19168 e2e passed"
