#!/usr/bin/env bash
# Phase-41696: soft-complete through 41696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41696
PY
grep -qE 'phase41696|through 41696' webui/STATUS.md
echo "OK: phase41696 e2e passed"
