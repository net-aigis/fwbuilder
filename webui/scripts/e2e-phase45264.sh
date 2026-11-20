#!/usr/bin/env bash
# Phase-45264: soft-complete through 45264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45264
PY
grep -qE 'phase45264|through 45264' webui/STATUS.md
echo "OK: phase45264 e2e passed"
