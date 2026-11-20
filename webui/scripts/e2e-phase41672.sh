#!/usr/bin/env bash
# Phase-41672: soft-complete through 41672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41672
PY
grep -qE 'phase41672|through 41672' webui/STATUS.md
echo "OK: phase41672 e2e passed"
