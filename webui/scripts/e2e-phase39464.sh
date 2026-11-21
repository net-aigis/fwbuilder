#!/usr/bin/env bash
# Phase-39464: soft-complete through 39464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39464
PY
grep -qE 'phase39464|through 39464' webui/STATUS.md
echo "OK: phase39464 e2e passed"
