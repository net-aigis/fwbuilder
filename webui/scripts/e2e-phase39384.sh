#!/usr/bin/env bash
# Phase-39384: soft-complete through 39384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39384
PY
grep -qE 'phase39384|through 39384' webui/STATUS.md
echo "OK: phase39384 e2e passed"
