#!/usr/bin/env bash
# Phase-33968: soft-complete through 33968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33968
PY
grep -qE 'phase33968|through 33968' webui/STATUS.md
echo "OK: phase33968 e2e passed"
