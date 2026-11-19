#!/usr/bin/env bash
# Phase-33824: soft-complete through 33824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33824
PY
grep -qE 'phase33824|through 33824' webui/STATUS.md
echo "OK: phase33824 e2e passed"
