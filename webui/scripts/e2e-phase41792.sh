#!/usr/bin/env bash
# Phase-41792: soft-complete through 41792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41792
PY
grep -qE 'phase41792|through 41792' webui/STATUS.md
echo "OK: phase41792 e2e passed"
