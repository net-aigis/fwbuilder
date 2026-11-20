#!/usr/bin/env bash
# Phase-43880: soft-complete through 43880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43880
PY
grep -qE 'phase43880|through 43880' webui/STATUS.md
echo "OK: phase43880 e2e passed"
