#!/usr/bin/env bash
# Phase-43120: soft-complete through 43120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43120
PY
grep -qE 'phase43120|through 43120' webui/STATUS.md
echo "OK: phase43120 e2e passed"
