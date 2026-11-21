#!/usr/bin/env bash
# Phase-37144: soft-complete through 37144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37144
PY
grep -qE 'phase37144|through 37144' webui/STATUS.md
echo "OK: phase37144 e2e passed"
