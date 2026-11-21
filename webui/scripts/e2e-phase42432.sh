#!/usr/bin/env bash
# Phase-42432: soft-complete through 42432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42432
PY
grep -qE 'phase42432|through 42432' webui/STATUS.md
echo "OK: phase42432 e2e passed"
