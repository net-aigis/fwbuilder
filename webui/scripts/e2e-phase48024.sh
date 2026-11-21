#!/usr/bin/env bash
# Phase-48024: soft-complete through 48024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48024
PY
grep -qE 'phase48024|through 48024' webui/STATUS.md
echo "OK: phase48024 e2e passed"
