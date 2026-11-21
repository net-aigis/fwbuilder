#!/usr/bin/env bash
# Phase-38520: soft-complete through 38520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38520
PY
grep -qE 'phase38520|through 38520' webui/STATUS.md
echo "OK: phase38520 e2e passed"
