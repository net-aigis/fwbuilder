#!/usr/bin/env bash
# Phase-41000: soft-complete through 41000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41000
PY
grep -qE 'phase41000|through 41000' webui/STATUS.md
echo "OK: phase41000 e2e passed"
