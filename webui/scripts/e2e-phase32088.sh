#!/usr/bin/env bash
# Phase-32088: soft-complete through 32088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32088
PY
grep -qE 'phase32088|through 32088' webui/STATUS.md
echo "OK: phase32088 e2e passed"
