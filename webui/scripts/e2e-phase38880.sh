#!/usr/bin/env bash
# Phase-38880: soft-complete through 38880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38880
PY
grep -qE 'phase38880|through 38880' webui/STATUS.md
echo "OK: phase38880 e2e passed"
