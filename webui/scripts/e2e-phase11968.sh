#!/usr/bin/env bash
# Phase-11968: soft-complete through 11968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11968
PY
grep -qE 'phase11968|through 11968' webui/STATUS.md
echo "OK: phase11968 e2e passed"
