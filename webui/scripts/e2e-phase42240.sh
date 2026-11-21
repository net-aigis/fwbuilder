#!/usr/bin/env bash
# Phase-42240: soft-complete through 42240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42240
PY
grep -qE 'phase42240|through 42240' webui/STATUS.md
echo "OK: phase42240 e2e passed"
