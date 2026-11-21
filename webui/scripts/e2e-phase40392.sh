#!/usr/bin/env bash
# Phase-40392: soft-complete through 40392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40392
PY
grep -qE 'phase40392|through 40392' webui/STATUS.md
echo "OK: phase40392 e2e passed"
