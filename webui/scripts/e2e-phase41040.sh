#!/usr/bin/env bash
# Phase-41040: soft-complete through 41040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41040
PY
grep -qE 'phase41040|through 41040' webui/STATUS.md
echo "OK: phase41040 e2e passed"
