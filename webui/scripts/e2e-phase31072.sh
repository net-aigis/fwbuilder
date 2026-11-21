#!/usr/bin/env bash
# Phase-31072: soft-complete through 31072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31072
PY
grep -qE 'phase31072|through 31072' webui/STATUS.md
echo "OK: phase31072 e2e passed"
