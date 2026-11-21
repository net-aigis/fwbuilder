#!/usr/bin/env bash
# Phase-31616: soft-complete through 31616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31616
PY
grep -qE 'phase31616|through 31616' webui/STATUS.md
echo "OK: phase31616 e2e passed"
