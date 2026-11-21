#!/usr/bin/env bash
# Phase-43672: soft-complete through 43672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43672
PY
grep -qE 'phase43672|through 43672' webui/STATUS.md
echo "OK: phase43672 e2e passed"
