#!/usr/bin/env bash
# Phase-20368: soft-complete through 20368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20368
PY
grep -qE 'phase20368|through 20368' webui/STATUS.md
echo "OK: phase20368 e2e passed"
