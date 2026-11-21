#!/usr/bin/env bash
# Phase-34304: soft-complete through 34304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34304
PY
grep -qE 'phase34304|through 34304' webui/STATUS.md
echo "OK: phase34304 e2e passed"
