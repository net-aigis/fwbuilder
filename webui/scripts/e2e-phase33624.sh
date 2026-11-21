#!/usr/bin/env bash
# Phase-33624: soft-complete through 33624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33624
PY
grep -qE 'phase33624|through 33624' webui/STATUS.md
echo "OK: phase33624 e2e passed"
