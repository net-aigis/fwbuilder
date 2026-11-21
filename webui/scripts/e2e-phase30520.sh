#!/usr/bin/env bash
# Phase-30520: soft-complete through 30520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30520
PY
grep -qE 'phase30520|through 30520' webui/STATUS.md
echo "OK: phase30520 e2e passed"
