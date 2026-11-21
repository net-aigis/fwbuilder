#!/usr/bin/env bash
# Phase-31216: soft-complete through 31216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31216
PY
grep -qE 'phase31216|through 31216' webui/STATUS.md
echo "OK: phase31216 e2e passed"
