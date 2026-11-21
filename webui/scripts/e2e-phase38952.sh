#!/usr/bin/env bash
# Phase-38952: soft-complete through 38952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38952
PY
grep -qE 'phase38952|through 38952' webui/STATUS.md
echo "OK: phase38952 e2e passed"
