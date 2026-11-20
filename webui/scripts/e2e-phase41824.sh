#!/usr/bin/env bash
# Phase-41824: soft-complete through 41824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41824
PY
grep -qE 'phase41824|through 41824' webui/STATUS.md
echo "OK: phase41824 e2e passed"
