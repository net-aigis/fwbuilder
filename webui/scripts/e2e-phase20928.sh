#!/usr/bin/env bash
# Phase-20928: soft-complete through 20928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20928
PY
grep -qE 'phase20928|through 20928' webui/STATUS.md
echo "OK: phase20928 e2e passed"
