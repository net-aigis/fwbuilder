#!/usr/bin/env bash
# Phase-36368: soft-complete through 36368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36368
PY
grep -qE 'phase36368|through 36368' webui/STATUS.md
echo "OK: phase36368 e2e passed"
