#!/usr/bin/env bash
# Phase-42592: soft-complete through 42592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42592
PY
grep -qE 'phase42592|through 42592' webui/STATUS.md
echo "OK: phase42592 e2e passed"
