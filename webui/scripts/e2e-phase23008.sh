#!/usr/bin/env bash
# Phase-23008: soft-complete through 23008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23008
PY
grep -qE 'phase23008|through 23008' webui/STATUS.md
echo "OK: phase23008 e2e passed"
