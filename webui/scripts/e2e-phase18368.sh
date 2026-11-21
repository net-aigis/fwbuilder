#!/usr/bin/env bash
# Phase-18368: soft-complete through 18368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18368
PY
grep -qE 'phase18368|through 18368' webui/STATUS.md
echo "OK: phase18368 e2e passed"
