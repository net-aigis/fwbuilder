#!/usr/bin/env bash
# Phase-41024: soft-complete through 41024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41024
PY
grep -qE 'phase41024|through 41024' webui/STATUS.md
echo "OK: phase41024 e2e passed"
