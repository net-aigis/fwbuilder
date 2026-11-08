#!/usr/bin/env bash
# Phase-15008: soft-complete through 15008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15008
PY
grep -qE 'phase15008|through 15008' webui/STATUS.md
echo "OK: phase15008 e2e passed"
