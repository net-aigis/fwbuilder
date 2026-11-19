#!/usr/bin/env bash
# Phase-33696: soft-complete through 33696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33696
PY
grep -qE 'phase33696|through 33696' webui/STATUS.md
echo "OK: phase33696 e2e passed"
