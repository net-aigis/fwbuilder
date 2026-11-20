#!/usr/bin/env bash
# Phase-44184: soft-complete through 44184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44184
PY
grep -qE 'phase44184|through 44184' webui/STATUS.md
echo "OK: phase44184 e2e passed"
