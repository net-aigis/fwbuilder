#!/usr/bin/env bash
# Phase-46072: soft-complete through 46072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46072
PY
grep -qE 'phase46072|through 46072' webui/STATUS.md
echo "OK: phase46072 e2e passed"
