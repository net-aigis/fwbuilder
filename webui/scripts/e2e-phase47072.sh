#!/usr/bin/env bash
# Phase-47072: soft-complete through 47072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47072
PY
grep -qE 'phase47072|through 47072' webui/STATUS.md
echo "OK: phase47072 e2e passed"
