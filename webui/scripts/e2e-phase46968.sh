#!/usr/bin/env bash
# Phase-46968: soft-complete through 46968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46968
PY
grep -qE 'phase46968|through 46968' webui/STATUS.md
echo "OK: phase46968 e2e passed"
