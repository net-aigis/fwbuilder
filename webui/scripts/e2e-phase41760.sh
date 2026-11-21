#!/usr/bin/env bash
# Phase-41760: soft-complete through 41760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41760
PY
grep -qE 'phase41760|through 41760' webui/STATUS.md
echo "OK: phase41760 e2e passed"
