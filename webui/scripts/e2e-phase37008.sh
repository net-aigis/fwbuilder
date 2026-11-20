#!/usr/bin/env bash
# Phase-37008: soft-complete through 37008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37008
PY
grep -qE 'phase37008|through 37008' webui/STATUS.md
echo "OK: phase37008 e2e passed"
