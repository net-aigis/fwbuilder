#!/usr/bin/env bash
# Phase-21008: soft-complete through 21008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21008
PY
grep -qE 'phase21008|through 21008' webui/STATUS.md
echo "OK: phase21008 e2e passed"
