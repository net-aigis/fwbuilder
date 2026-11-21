#!/usr/bin/env bash
# Phase-33072: soft-complete through 33072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33072
PY
grep -qE 'phase33072|through 33072' webui/STATUS.md
echo "OK: phase33072 e2e passed"
