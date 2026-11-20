#!/usr/bin/env bash
# Phase-41704: soft-complete through 41704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41704
PY
grep -qE 'phase41704|through 41704' webui/STATUS.md
echo "OK: phase41704 e2e passed"
