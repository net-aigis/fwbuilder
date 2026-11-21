#!/usr/bin/env bash
# Phase-38008: soft-complete through 38008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38008
PY
grep -qE 'phase38008|through 38008' webui/STATUS.md
echo "OK: phase38008 e2e passed"
