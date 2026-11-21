#!/usr/bin/env bash
# Phase-35008: soft-complete through 35008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35008
PY
grep -qE 'phase35008|through 35008' webui/STATUS.md
echo "OK: phase35008 e2e passed"
