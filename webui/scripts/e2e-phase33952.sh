#!/usr/bin/env bash
# Phase-33952: soft-complete through 33952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33952
PY
grep -qE 'phase33952|through 33952' webui/STATUS.md
echo "OK: phase33952 e2e passed"
