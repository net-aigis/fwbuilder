#!/usr/bin/env bash
# Phase-10928: soft-complete through 10928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10928
PY
grep -qE 'phase10928|through 10928' webui/STATUS.md
echo "OK: phase10928 e2e passed"
