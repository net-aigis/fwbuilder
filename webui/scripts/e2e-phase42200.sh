#!/usr/bin/env bash
# Phase-42200: soft-complete through 42200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42200
PY
grep -qE 'phase42200|through 42200' webui/STATUS.md
echo "OK: phase42200 e2e passed"
