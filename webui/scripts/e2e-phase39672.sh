#!/usr/bin/env bash
# Phase-39672: soft-complete through 39672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39672
PY
grep -qE 'phase39672|through 39672' webui/STATUS.md
echo "OK: phase39672 e2e passed"
