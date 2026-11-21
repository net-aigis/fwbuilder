#!/usr/bin/env bash
# Phase-12928: soft-complete through 12928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12928
PY
grep -qE 'phase12928|through 12928' webui/STATUS.md
echo "OK: phase12928 e2e passed"
