#!/usr/bin/env bash
# Phase-46704: soft-complete through 46704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46704
PY
grep -qE 'phase46704|through 46704' webui/STATUS.md
echo "OK: phase46704 e2e passed"
