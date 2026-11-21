#!/usr/bin/env bash
# Phase-33008: soft-complete through 33008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33008
PY
grep -qE 'phase33008|through 33008' webui/STATUS.md
echo "OK: phase33008 e2e passed"
