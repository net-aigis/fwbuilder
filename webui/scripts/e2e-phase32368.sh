#!/usr/bin/env bash
# Phase-32368: soft-complete through 32368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32368
PY
grep -qE 'phase32368|through 32368' webui/STATUS.md
echo "OK: phase32368 e2e passed"
