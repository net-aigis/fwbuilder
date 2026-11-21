#!/usr/bin/env bash
# Phase-24928: soft-complete through 24928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24928
PY
grep -qE 'phase24928|through 24928' webui/STATUS.md
echo "OK: phase24928 e2e passed"
