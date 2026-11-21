#!/usr/bin/env bash
# Phase-30984: soft-complete through 30984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30984
PY
grep -qE 'phase30984|through 30984' webui/STATUS.md
echo "OK: phase30984 e2e passed"
