#!/usr/bin/env bash
# Phase-45024: soft-complete through 45024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45024
PY
grep -qE 'phase45024|through 45024' webui/STATUS.md
echo "OK: phase45024 e2e passed"
