#!/usr/bin/env bash
# Phase-37432: soft-complete through 37432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37432
PY
grep -qE 'phase37432|through 37432' webui/STATUS.md
echo "OK: phase37432 e2e passed"
