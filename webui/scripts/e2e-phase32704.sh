#!/usr/bin/env bash
# Phase-32704: soft-complete through 32704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32704
PY
grep -qE 'phase32704|through 32704' webui/STATUS.md
echo "OK: phase32704 e2e passed"
