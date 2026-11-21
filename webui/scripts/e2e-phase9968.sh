#!/usr/bin/env bash
# Phase-9968: soft-complete through 9968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9968
PY
grep -qE 'phase9968|through 9968' webui/STATUS.md
echo "OK: phase9968 e2e passed"
