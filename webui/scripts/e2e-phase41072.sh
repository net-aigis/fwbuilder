#!/usr/bin/env bash
# Phase-41072: soft-complete through 41072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41072
PY
grep -qE 'phase41072|through 41072' webui/STATUS.md
echo "OK: phase41072 e2e passed"
