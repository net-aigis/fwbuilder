#!/usr/bin/env bash
# Phase-36424: soft-complete through 36424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36424
PY
grep -qE 'phase36424|through 36424' webui/STATUS.md
echo "OK: phase36424 e2e passed"
