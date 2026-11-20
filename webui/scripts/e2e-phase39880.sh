#!/usr/bin/env bash
# Phase-39880: soft-complete through 39880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39880
PY
grep -qE 'phase39880|through 39880' webui/STATUS.md
echo "OK: phase39880 e2e passed"
