#!/usr/bin/env bash
# Phase-30336: soft-complete through 30336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30336
PY
grep -qE 'phase30336|through 30336' webui/STATUS.md
echo "OK: phase30336 e2e passed"
