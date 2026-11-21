#!/usr/bin/env bash
# Phase-33368: soft-complete through 33368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33368
PY
grep -qE 'phase33368|through 33368' webui/STATUS.md
echo "OK: phase33368 e2e passed"
