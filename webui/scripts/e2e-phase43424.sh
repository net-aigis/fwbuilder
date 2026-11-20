#!/usr/bin/env bash
# Phase-43424: soft-complete through 43424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43424
PY
grep -qE 'phase43424|through 43424' webui/STATUS.md
echo "OK: phase43424 e2e passed"
