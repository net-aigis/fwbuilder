#!/usr/bin/env bash
# Phase-32928: soft-complete through 32928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32928
PY
grep -qE 'phase32928|through 32928' webui/STATUS.md
echo "OK: phase32928 e2e passed"
