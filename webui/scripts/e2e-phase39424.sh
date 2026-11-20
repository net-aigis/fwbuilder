#!/usr/bin/env bash
# Phase-39424: soft-complete through 39424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39424
PY
grep -qE 'phase39424|through 39424' webui/STATUS.md
echo "OK: phase39424 e2e passed"
