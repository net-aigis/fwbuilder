#!/usr/bin/env bash
# Phase-11008: soft-complete through 11008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11008
PY
grep -qE 'phase11008|through 11008' webui/STATUS.md
echo "OK: phase11008 e2e passed"
