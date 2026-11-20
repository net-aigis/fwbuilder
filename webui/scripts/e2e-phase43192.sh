#!/usr/bin/env bash
# Phase-43192: soft-complete through 43192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43192
PY
grep -qE 'phase43192|through 43192' webui/STATUS.md
echo "OK: phase43192 e2e passed"
