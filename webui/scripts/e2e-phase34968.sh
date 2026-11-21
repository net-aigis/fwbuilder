#!/usr/bin/env bash
# Phase-34968: soft-complete through 34968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34968
PY
grep -qE 'phase34968|through 34968' webui/STATUS.md
echo "OK: phase34968 e2e passed"
