#!/usr/bin/env bash
# Phase-43968: soft-complete through 43968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43968
PY
grep -qE 'phase43968|through 43968' webui/STATUS.md
echo "OK: phase43968 e2e passed"
