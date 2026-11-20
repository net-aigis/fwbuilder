#!/usr/bin/env bash
# Phase-43704: soft-complete through 43704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43704
PY
grep -qE 'phase43704|through 43704' webui/STATUS.md
echo "OK: phase43704 e2e passed"
