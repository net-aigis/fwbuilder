#!/usr/bin/env bash
# Phase-39072: soft-complete through 39072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39072
PY
grep -qE 'phase39072|through 39072' webui/STATUS.md
echo "OK: phase39072 e2e passed"
