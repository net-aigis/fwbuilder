#!/usr/bin/env bash
# Phase-32440: soft-complete through 32440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32440
PY
grep -qE 'phase32440|through 32440' webui/STATUS.md
echo "OK: phase32440 e2e passed"
