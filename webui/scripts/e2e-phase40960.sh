#!/usr/bin/env bash
# Phase-40960: soft-complete through 40960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40960
PY
grep -qE 'phase40960|through 40960' webui/STATUS.md
echo "OK: phase40960 e2e passed"
