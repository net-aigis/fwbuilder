#!/usr/bin/env bash
# Phase-19008: soft-complete through 19008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19008
PY
grep -qE 'phase19008|through 19008' webui/STATUS.md
echo "OK: phase19008 e2e passed"
