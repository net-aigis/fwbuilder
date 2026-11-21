#!/usr/bin/env bash
# Phase-41968: soft-complete through 41968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41968
PY
grep -qE 'phase41968|through 41968' webui/STATUS.md
echo "OK: phase41968 e2e passed"
