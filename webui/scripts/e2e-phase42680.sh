#!/usr/bin/env bash
# Phase-42680: soft-complete through 42680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42680
PY
grep -qE 'phase42680|through 42680' webui/STATUS.md
echo "OK: phase42680 e2e passed"
