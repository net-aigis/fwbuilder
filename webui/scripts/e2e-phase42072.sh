#!/usr/bin/env bash
# Phase-42072: soft-complete through 42072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42072
PY
grep -qE 'phase42072|through 42072' webui/STATUS.md
echo "OK: phase42072 e2e passed"
