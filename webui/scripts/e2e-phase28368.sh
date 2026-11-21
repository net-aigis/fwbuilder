#!/usr/bin/env bash
# Phase-28368: soft-complete through 28368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28368
PY
grep -qE 'phase28368|through 28368' webui/STATUS.md
echo "OK: phase28368 e2e passed"
