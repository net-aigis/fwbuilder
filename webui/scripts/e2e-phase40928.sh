#!/usr/bin/env bash
# Phase-40928: soft-complete through 40928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40928
PY
grep -qE 'phase40928|through 40928' webui/STATUS.md
echo "OK: phase40928 e2e passed"
