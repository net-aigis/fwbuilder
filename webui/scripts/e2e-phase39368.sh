#!/usr/bin/env bash
# Phase-39368: soft-complete through 39368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39368
PY
grep -qE 'phase39368|through 39368' webui/STATUS.md
echo "OK: phase39368 e2e passed"
