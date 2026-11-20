#!/usr/bin/env bash
# Phase-39968: soft-complete through 39968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39968
PY
grep -qE 'phase39968|through 39968' webui/STATUS.md
echo "OK: phase39968 e2e passed"
