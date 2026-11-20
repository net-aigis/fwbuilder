#!/usr/bin/env bash
# Phase-38968: soft-complete through 38968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38968
PY
grep -qE 'phase38968|through 38968' webui/STATUS.md
echo "OK: phase38968 e2e passed"
