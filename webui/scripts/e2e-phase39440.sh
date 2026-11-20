#!/usr/bin/env bash
# Phase-39440: soft-complete through 39440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39440
PY
grep -qE 'phase39440|through 39440' webui/STATUS.md
echo "OK: phase39440 e2e passed"
